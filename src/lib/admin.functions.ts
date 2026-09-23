import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { appRoleSchema } from "./schemas";

export const getAdminStats = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { count: jobsCount } = await context.supabase
      .from("jobs")
      .select("*", { count: "exact", head: true });

    const { count: totalApplications } = await context.supabase
      .from("applications")
      .select("*", { count: "exact", head: true });

    const { count: pendingCount } = await context.supabase
      .from("applications")
      .select("*", { count: "exact", head: true })
      .in("status", ["pending", "new"]);

    const { count: underReviewCount } = await context.supabase
      .from("applications")
      .select("*", { count: "exact", head: true })
      .in("status", ["under_review", "interview", "documents_required", "processing"]);

    const { count: approvedCount } = await context.supabase
      .from("applications")
      .select("*", { count: "exact", head: true })
      .in("status", ["approved", "completed"]);

    const { count: rejectedCount } = await context.supabase
      .from("applications")
      .select("*", { count: "exact", head: true })
      .eq("status", "rejected");

    const { count: usersCount } = await context.supabase
      .from("profiles")
      .select("*", { count: "exact", head: true });

    const { data: recentApplications } = await context.supabase
      .from("applications")
      .select("id, applicant_name, applicant_country, country_of_interest, job_category, status, created_at")
      .order("created_at", { ascending: false })
      .limit(10);

    return {
      jobs: jobsCount ?? 0,
      totalApplications: totalApplications ?? 0,
      pendingApplications: pendingCount ?? 0,
      underReviewApplications: underReviewCount ?? 0,
      approvedApplications: approvedCount ?? 0,
      rejectedApplications: rejectedCount ?? 0,
      users: usersCount ?? 0,
      recentApplications: recentApplications ?? [],
    };
  });

export const getAuditLogs = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data, error } = await context.supabase
      .from("audit_logs")
      .select("*")
      .order("created_at", { ascending: false })
      .limit(200);
    if (error) throw new Error(error.message);
    return data ?? [];
  });

export const getUserRoles = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data, error } = await context.supabase
      .from("user_roles")
      .select("*");
    if (error) throw new Error(error.message);
    const rows = data ?? [];
    const userIds = [...new Set(rows.map((r) => r.user_id))];
    const { data: profiles } = userIds.length
      ? await context.supabase
          .from("profiles")
          .select("id, user_id, full_name, email")
          .in("user_id", userIds)
      : { data: [] as { id: string; user_id: string; full_name: string | null; email: string | null }[] };
    const byUser = new Map((profiles ?? []).map((p) => [p.user_id, p]));
    return rows.map((r) => ({ ...r, profiles: byUser.get(r.user_id) ?? null }));
  });

export const setUserRole = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) =>
    z.object({ user_id: z.string().uuid(), role: appRoleSchema }).parse(data)
  )
  .handler(async ({ context, data }) => {
    const { data: role, error } = await context.supabase
      .from("user_roles")
      .insert({ user_id: data.user_id, role: data.role })
      .select()
      .single();
    if (error) throw new Error(error.message);

    await context.supabase.from("audit_logs").insert({
      actor_id: context.userId,
      action: "role_assigned",
      entity_type: "user_role",
      entity_id: role.id,
      metadata: { user_id: data.user_id, role: data.role },
    });

    return role;
  });

export const removeUserRole = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) =>
    z.object({ user_id: z.string().uuid(), role: appRoleSchema }).parse(data)
  )
  .handler(async ({ context, data }) => {
    const { error } = await context.supabase
      .from("user_roles")
      .delete()
      .eq("user_id", data.user_id)
      .eq("role", data.role);
    if (error) throw new Error(error.message);

    await context.supabase.from("audit_logs").insert({
      actor_id: context.userId,
      action: "role_removed",
      entity_type: "user_role",
      metadata: { user_id: data.user_id, role: data.role },
    });

    return { success: true };
  });

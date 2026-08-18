import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { applicationSchema, applicationStatusUpdateSchema } from "./schemas";

export const getMyApplications = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data, error } = await context.supabase
      .from("applications")
      .select("*, jobs(title, country, category)")
      .eq("user_id", context.userId)
      .order("created_at", { ascending: false });
    if (error) throw new Error(error.message);
    return data ?? [];
  });

export const hasApplied = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => z.object({ job_id: z.string().uuid() }).parse(data))
  .handler(async ({ context, data }) => {
    const { data: existing, error } = await context.supabase
      .from("applications")
      .select("id")
      .eq("user_id", context.userId)
      .eq("job_id", data.job_id)
      .maybeSingle();
    if (error) throw new Error(error.message);
    return { applied: !!existing };
  });

export const createApplication = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => applicationSchema.parse(data))
  .handler(async ({ context, data }) => {
    const { data: existing } = await context.supabase
      .from("applications")
      .select("id")
      .eq("user_id", context.userId)
      .eq("job_id", data.job_id)
      .maybeSingle();
    if (existing) throw new Error("You have already applied for this job.");

    const { data: application, error } = await context.supabase
      .from("applications")
      .insert({
        user_id: context.userId,
        job_id: data.job_id,
        cover_letter: data.cover_letter,
      })
      .select()
      .single();
    if (error) throw new Error(error.message);

    await context.supabase.from("audit_logs").insert({
      actor_id: context.userId,
      action: "application_created",
      entity_type: "application",
      entity_id: application.id,
      metadata: { job_id: data.job_id },
    });

    return application;
  });

export const getAllApplications = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data, error } = await context.supabase
      .from("applications")
      .select("*, jobs(title, country, category), profiles(full_name, phone, country)")
      .order("created_at", { ascending: false });
    if (error) throw new Error(error.message);
    return data ?? [];
  });

export const updateApplicationStatus = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => applicationStatusUpdateSchema.parse(data))
  .handler(async ({ context, data }) => {
    const { data: application, error } = await context.supabase
      .from("applications")
      .update({
        status: data.status,
        admin_notes: data.admin_notes ?? null,
      })
      .eq("id", data.id)
      .select()
      .single();
    if (error) throw new Error(error.message);

    await context.supabase.from("audit_logs").insert({
      actor_id: context.userId,
      action: "application_status_updated",
      entity_type: "application",
      entity_id: data.id,
      metadata: { status: data.status, notes: data.admin_notes },
    });

    return application;
  });

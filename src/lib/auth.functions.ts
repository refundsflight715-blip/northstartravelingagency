import { createServerFn } from "@tanstack/react-start";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";

export const getCurrentUser = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data: profile, error: profileError } = await context.supabase
      .from("profiles")
      .select("*")
      .eq("id", context.userId)
      .single();

    const { data: roles, error: rolesError } = await context.supabase
      .from("user_roles")
      .select("role")
      .eq("user_id", context.userId);

    if (profileError || rolesError) {
      throw new Error("Failed to load user.");
    }

    return {
      id: context.userId,
      email: context.claims.email,
      profile,
      roles: roles?.map((r) => r.role) ?? [],
    };
  });

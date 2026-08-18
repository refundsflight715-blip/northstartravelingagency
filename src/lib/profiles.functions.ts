import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { profileSchema } from "./schemas";

export const getMyProfile = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data, error } = await context.supabase
      .from("profiles")
      .select("*")
      .eq("id", context.userId)
      .single();
    if (error) throw new Error(error.message);
    return data;
  });

export const updateProfile = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => profileSchema.parse(data))
  .handler(async ({ context, data }) => {
    const { data: profile, error } = await context.supabase
      .from("profiles")
      .update({
        full_name: data.full_name,
        phone: data.phone ?? null,
        country: data.country ?? null,
        bio: data.bio ?? null,
        resume_url: data.resume_url ?? null,
      })
      .eq("id", context.userId)
      .select()
      .single();
    if (error) throw new Error(error.message);
    return profile;
  });

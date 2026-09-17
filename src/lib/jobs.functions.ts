import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { supabase } from "@/integrations/supabase/client";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { jobSchema } from "./schemas";

const jobFilterSchema = z.object({
  category: z.string().optional(),
  country: z.string().optional(),
  search: z.string().optional(),
});

export const getPublishedJobs = createServerFn({ method: "GET" })
  .inputValidator((data: unknown) => jobFilterSchema.parse(data))
  .handler(async ({ data }) => {
    let query = supabase
      .from("jobs")
      .select("*")
      .eq("status", "published")
      .order("featured", { ascending: false })
      .order("posted_at", { ascending: false });

    if (data.category) {
      query = query.eq("category", data.category);
    }
    if (data.country) {
      query = query.eq("country", data.country);
    }
    if (data.search) {
      query = query.or(
        `title.ilike.%${data.search}%,description.ilike.%${data.search}%,location.ilike.%${data.search}%`
      );
    }

    const { data: jobs, error } = await query;
    if (error) throw new Error(error.message);
    return jobs ?? [];
  });

export const getJobById = createServerFn({ method: "GET" })
  .inputValidator((data: unknown) => z.object({ id: z.string().uuid() }).parse(data))
  .handler(async ({ data }) => {
    const { data: job, error } = await supabase
      .from("jobs")
      .select("*")
      .eq("id", data.id)
      .single();
    if (error) throw new Error(error.message);
    return job;
  });

export const getAllJobs = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { data: jobs, error } = await context.supabase
      .from("jobs")
      .select("*")
      .order("created_at", { ascending: false });
    if (error) throw new Error(error.message);
    return jobs ?? [];
  });

export const createJob = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => jobSchema.parse(data))
  .handler(async ({ context, data }) => {
    const insert = {
      title: data.title,
      category: data.category,
      country: data.country,
      location: data.location ?? null,
      description: data.description,
      requirements: data.requirements,
      salary: data.salary ?? null,
      vacancies: data.vacancies ?? null,
      job_type: data.job_type,
      status: data.status,
      featured: data.featured,
      expires_at: data.expires_at ?? null,
      posted_at: data.status === "published" ? new Date().toISOString() : null,
    };
    const { data: job, error } = await context.supabase
      .from("jobs")
      .insert(insert)
      .select()
      .single();
    if (error) throw new Error(error.message);
    return job;
  });

export const updateJob = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) =>
    z.intersection(z.object({ id: z.string().uuid() }), jobSchema).parse(data)
  )
  .handler(async ({ context, data }) => {
    const { id, ...rest } = data;
    const { data: existing } = await context.supabase
      .from("jobs")
      .select("posted_at")
      .eq("id", id)
      .single();

    const update = {
      title: rest.title,
      category: rest.category,
      country: rest.country,
      location: rest.location ?? null,
      description: rest.description,
      requirements: rest.requirements,
      salary: rest.salary ?? null,
      vacancies: rest.vacancies ?? null,
      job_type: rest.job_type,
      status: rest.status,
      featured: rest.featured,
      expires_at: rest.expires_at ?? null,
      posted_at:
        rest.status === "published" && !existing?.posted_at
          ? new Date().toISOString()
          : null,
    };
    const { data: job, error } = await context.supabase
      .from("jobs")
      .update(update)
      .eq("id", id)
      .select()
      .single();
    if (error) throw new Error(error.message);
    return job;
  });

export const deleteJob = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((data: unknown) => z.object({ id: z.string().uuid() }).parse(data))
  .handler(async ({ context, data }) => {
    const { error } = await context.supabase.from("jobs").delete().eq("id", data.id);
    if (error) throw new Error(error.message);
    return { success: true };
  });

import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import type { SupabaseClient } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { jobSchema } from "./schemas";
import { getCountryBySlug } from "./site";

export function slugifyTitle(value: string) {
  return (
    value
      .normalize("NFKD")
      .replace(/[\u0300-\u036f]/g, "")
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "")
      .slice(0, 80) || "job"
  );
}

/** Returns a slug unique across the jobs table, appending -2, -3 ... on collisions. */
async function uniqueJobSlug(
  client: SupabaseClient<any, any, any>,
  title: string,
  ignoreId?: string
) {
  const base = slugifyTitle(title);
  let candidate = base;
  for (let i = 2; i < 200; i += 1) {
    let query = client.from("jobs").select("id").eq("slug", candidate).limit(1);
    if (ignoreId) query = query.neq("id", ignoreId);
    const { data } = await query;
    if (!data || data.length === 0) return candidate;
    candidate = `${base}-${i}`;
  }
  return `${base}-${Date.now()}`;
}

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
        `title.ilike.%${data.search}%,description.ilike.%${data.search}%,location.ilike.%${data.search}%,qualifications.ilike.%${data.search}%,responsibilities.ilike.%${data.search}%`
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
      slug: await uniqueJobSlug(context.supabase, data.title),
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
      required_experience: data.required_experience ?? null,
      qualifications: data.qualifications ?? null,
      responsibilities: data.responsibilities ?? null,
      accommodation: data.accommodation ?? null,
      transport: data.transport ?? null,
      medical_coverage: data.medical_coverage ?? null,
      contract_duration: data.contract_duration ?? null,
      visa_info: data.visa_info ?? null,
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
      .select("posted_at, slug, title")
      .eq("id", id)
      .single();

    const needsSlug = !existing?.slug || existing.title !== rest.title;

    const update = {
      slug: needsSlug ? await uniqueJobSlug(context.supabase, rest.title, id) : existing!.slug,
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
      required_experience: rest.required_experience ?? null,
      qualifications: rest.qualifications ?? null,
      responsibilities: rest.responsibilities ?? null,
      accommodation: rest.accommodation ?? null,
      transport: rest.transport ?? null,
      medical_coverage: rest.medical_coverage ?? null,
      contract_duration: rest.contract_duration ?? null,
      visa_info: rest.visa_info ?? null,
      posted_at:
        rest.status === "published"
          ? (existing?.posted_at ?? new Date().toISOString())
          : (existing?.posted_at ?? null),
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

export const getJobsByCountrySlug = createServerFn({ method: "GET" })
  .inputValidator((data: unknown) => z.object({ country_slug: z.string() }).parse(data))
  .handler(async ({ data }) => {
    const country = getCountryBySlug(data.country_slug);
    if (!country) return null;

    const { data: jobs, error } = await supabase
      .from("jobs")
      .select("*")
      .eq("status", "published")
      .in("country", country.aliases)
      .order("featured", { ascending: false })
      .order("posted_at", { ascending: false });
    if (error) throw new Error(error.message);
    return jobs ?? [];
  });

export const getJobBySlug = createServerFn({ method: "GET" })
  .inputValidator((data: unknown) => z.object({ job_slug: z.string() }).parse(data))
  .handler(async ({ data }) => {
    const { data: bySlug } = await supabase
      .from("jobs")
      .select("*")
      .eq("slug", data.job_slug)
      .limit(1);
    if (bySlug && bySlug.length > 0) return bySlug[0];

    // Fallback for jobs created before slugs existed (URL still carries the id).
    if (/^[0-9a-f-]{36}$/i.test(data.job_slug)) {
      const { data: byId } = await supabase
        .from("jobs")
        .select("*")
        .eq("id", data.job_slug)
        .limit(1);
      if (byId && byId.length > 0) return byId[0];
    }
    return null;
  });

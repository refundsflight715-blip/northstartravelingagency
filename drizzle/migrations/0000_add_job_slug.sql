ALTER TABLE public.jobs ADD COLUMN IF NOT EXISTS slug text;
CREATE UNIQUE INDEX IF NOT EXISTS jobs_slug_key ON public.jobs (slug) WHERE slug IS NOT NULL;
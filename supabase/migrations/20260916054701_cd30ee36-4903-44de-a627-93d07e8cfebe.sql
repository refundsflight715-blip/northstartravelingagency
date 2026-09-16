ALTER TABLE public.jobs ADD COLUMN IF NOT EXISTS vacancies integer;

ALTER TABLE public.applications
  ADD COLUMN IF NOT EXISTS applicant_name text,
  ADD COLUMN IF NOT EXISTS applicant_email text,
  ADD COLUMN IF NOT EXISTS applicant_phone text,
  ADD COLUMN IF NOT EXISTS applicant_country text;

UPDATE public.applications SET status = 'new' WHERE status IN ('pending');
UPDATE public.applications SET status = 'under_review' WHERE status IN ('reviewing');
UPDATE public.applications SET status = 'interview' WHERE status IN ('shortlisted');
UPDATE public.applications SET status = 'completed' WHERE status IN ('hired');

ALTER TABLE public.applications ALTER COLUMN status SET DEFAULT 'new';
ALTER TABLE public.jobs
  ADD COLUMN IF NOT EXISTS required_experience text,
  ADD COLUMN IF NOT EXISTS qualifications text,
  ADD COLUMN IF NOT EXISTS responsibilities text,
  ADD COLUMN IF NOT EXISTS accommodation text,
  ADD COLUMN IF NOT EXISTS transport text,
  ADD COLUMN IF NOT EXISTS medical_coverage text,
  ADD COLUMN IF NOT EXISTS contract_duration text,
  ADD COLUMN IF NOT EXISTS visa_info text;

DELETE FROM public.applications
WHERE job_id IN (
  SELECT id FROM public.jobs
  WHERE title IN (
    'Hotel Housekeeping Staff',
    'Caregiver for Elderly Clients',
    'Construction Laborer',
    'Farm Worker - Dairy',
    'Private Driver'
  )
);

DELETE FROM public.jobs
WHERE title IN (
  'Hotel Housekeeping Staff',
  'Caregiver for Elderly Clients',
  'Construction Laborer',
  'Farm Worker - Dairy',
  'Private Driver'
);
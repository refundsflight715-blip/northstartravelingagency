-- Extend public.applications table with comprehensive candidate application fields
ALTER TABLE public.applications
  ADD COLUMN IF NOT EXISTS nationality text,
  ADD COLUMN IF NOT EXISTS date_of_birth date,
  ADD COLUMN IF NOT EXISTS country_of_interest text,
  ADD COLUMN IF NOT EXISTS job_category text,
  ADD COLUMN IF NOT EXISTS passport_status text,
  ADD COLUMN IF NOT EXISTS qualifications text,
  ADD COLUMN IF NOT EXISTS work_experience text,
  ADD COLUMN IF NOT EXISTS cv_url text,
  ADD COLUMN IF NOT EXISTS additional_notes text;

-- Allow status to support pending, under_review, approved, rejected
DO 2265
BEGIN
    ALTER TABLE public.applications DROP CONSTRAINT IF EXISTS applications_status_check;
    ALTER TABLE public.applications ADD CONSTRAINT applications_status_check
      CHECK (status IN ('pending', 'under_review', 'approved', 'rejected', 'new', 'interview', 'documents_required', 'processing', 'completed'));
EXCEPTION WHEN OTHERS THEN
    NULL;
END 2265;

ALTER TABLE public.applications ALTER COLUMN status SET DEFAULT 'pending';

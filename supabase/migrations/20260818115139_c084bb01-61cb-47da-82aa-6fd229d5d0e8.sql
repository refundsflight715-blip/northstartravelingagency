-- Role enum
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'app_role') THEN
        CREATE TYPE public.app_role AS ENUM ('candidate', 'employer', 'admin');
    END IF;
END
$$;

-- User roles (must exist before has_role function)
CREATE TABLE IF NOT EXISTS public.user_roles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    role public.app_role NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    UNIQUE (user_id, role)
);

-- Role helper (must exist before any policy references it)
CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role public.app_role)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;

GRANT SELECT ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can read own roles" ON public.user_roles;
CREATE POLICY "Users can read own roles"
ON public.user_roles FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Admins can manage roles" ON public.user_roles;
CREATE POLICY "Admins can manage roles"
ON public.user_roles FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role))
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Profiles
CREATE TABLE IF NOT EXISTS public.profiles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL UNIQUE,
    full_name text,
    phone text,
    country text,
    resume_url text,
    bio text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);

GRANT SELECT, INSERT, UPDATE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own profile" ON public.profiles;
CREATE POLICY "Users can manage own profile"
ON public.profiles FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Admins can manage all profiles" ON public.profiles;
CREATE POLICY "Admins can manage all profiles"
ON public.profiles FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role))
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Jobs
CREATE TABLE IF NOT EXISTS public.jobs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title text NOT NULL,
    category text NOT NULL,
    country text NOT NULL,
    location text,
    description text NOT NULL,
    requirements text NOT NULL,
    salary text,
    job_type text DEFAULT 'full-time',
    status text DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'closed')),
    featured boolean DEFAULT false,
    posted_at timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);

GRANT SELECT ON public.jobs TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.jobs TO authenticated;
GRANT ALL ON public.jobs TO service_role;

ALTER TABLE public.jobs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Anyone can view published jobs" ON public.jobs;
CREATE POLICY "Anyone can view published jobs"
ON public.jobs FOR SELECT
TO anon, authenticated
USING (status = 'published');

DROP POLICY IF EXISTS "Admins can manage jobs" ON public.jobs;
CREATE POLICY "Admins can manage jobs"
ON public.jobs FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role))
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Applications
CREATE TABLE IF NOT EXISTS public.applications (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    job_id uuid REFERENCES public.jobs(id) ON DELETE CASCADE NOT NULL,
    status text DEFAULT 'pending' CHECK (status IN ('pending', 'reviewing', 'shortlisted', 'rejected', 'hired')),
    cover_letter text,
    admin_notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    UNIQUE (user_id, job_id)
);

GRANT SELECT, INSERT, UPDATE ON public.applications TO authenticated;
GRANT ALL ON public.applications TO service_role;

ALTER TABLE public.applications ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own applications" ON public.applications;
CREATE POLICY "Users can view own applications"
ON public.applications FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create applications" ON public.applications;
CREATE POLICY "Users can create applications"
ON public.applications FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Admins can manage applications" ON public.applications;
CREATE POLICY "Admins can manage applications"
ON public.applications FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role))
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Audit logs
CREATE TABLE IF NOT EXISTS public.audit_logs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    actor_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
    action text NOT NULL,
    entity_type text NOT NULL,
    entity_id uuid,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

GRANT INSERT ON public.audit_logs TO authenticated;
GRANT SELECT ON public.audit_logs TO authenticated;
GRANT ALL ON public.audit_logs TO service_role;

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admins can read all audit logs" ON public.audit_logs;
CREATE POLICY "Admins can read all audit logs"
ON public.audit_logs FOR SELECT
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role));

DROP POLICY IF EXISTS "Admins can create audit logs" ON public.audit_logs;
CREATE POLICY "Admins can create audit logs"
ON public.audit_logs FOR INSERT
TO authenticated
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Config
CREATE TABLE IF NOT EXISTS public.config (
    key text PRIMARY KEY,
    value jsonb NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);

GRANT SELECT ON public.config TO anon;
GRANT SELECT ON public.config TO authenticated;
GRANT ALL ON public.config TO service_role;

ALTER TABLE public.config ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Anyone can read config" ON public.config;
CREATE POLICY "Anyone can read config"
ON public.config FOR SELECT
TO anon, authenticated
USING (true);

DROP POLICY IF EXISTS "Admins can manage config" ON public.config;
CREATE POLICY "Admins can manage config"
ON public.config FOR ALL
TO authenticated
USING (public.has_role(auth.uid(), 'admin'::public.app_role))
WITH CHECK (public.has_role(auth.uid(), 'admin'::public.app_role));

-- Updated-at helper
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER
LANGUAGE plpgsql
SET search_path = public
AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS update_profiles_updated_at ON public.profiles;
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_jobs_updated_at ON public.jobs;
CREATE TRIGGER update_jobs_updated_at BEFORE UPDATE ON public.jobs
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_applications_updated_at ON public.applications;
CREATE TRIGGER update_applications_updated_at BEFORE UPDATE ON public.applications
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- Seed sample published jobs
INSERT INTO public.jobs (title, category, country, location, description, requirements, salary, job_type, status, featured, posted_at)
VALUES
('Hotel Housekeeping Staff', 'cleaners', 'United Arab Emirates', 'Dubai', 'Join a reputable hotel in Dubai as a housekeeping attendant. Responsibilities include cleaning guest rooms, public areas, and providing excellent service.', 'Previous cleaning experience preferred; good English communication; attention to detail.', 'AED 2,200 - 2,800 / month + accommodation', 'full-time', 'published', true, now()),
('Caregiver for Elderly Clients', 'caregivers', 'United Kingdom', 'London', 'Provide compassionate care and daily living support to elderly clients in private homes.', 'Relevant caregiving certification; patient and reliable; basic English.', '£1,800 - 2,400 / month', 'full-time', 'published', true, now()),
('Construction Laborer', 'construction', 'Qatar', 'Doha', 'Work on commercial construction sites in Doha. Duties include material handling, site cleanup, and assisting tradespeople.', 'Physically fit; able to work outdoors; safety awareness.', 'QAR 2,000 - 2,500 / month + transport', 'full-time', 'published', false, now()),
('Farm Worker - Dairy', 'farm', 'New Zealand', 'Canterbury', 'Assist with daily dairy farm operations including milking, feeding, and animal care.', 'Experience with livestock preferred; willing to work early hours.', 'NZD 22 - 26 / hour + accommodation', 'full-time', 'published', false, now()),
('Private Driver', 'drivers', 'Saudi Arabia', 'Riyadh', 'Drive family vehicles safely around Riyadh. Maintain vehicle cleanliness and schedule.', 'Valid driving license; clean record; professional attitude.', 'SAR 3,500 - 4,500 / month', 'full-time', 'published', false, now())
ON CONFLICT DO NOTHING;

-- Seed config defaults
INSERT INTO public.config (key, value) VALUES
('site_name', '"NorthStarTravelingAgency"'::jsonb),
('contact_email', '"info@northstartravelingagency.com"'::jsonb),
('contact_phone', '"+254 700 000000"'::jsonb),
('default_job_categories', '["cleaners", "drivers", "caregivers", "hotel staff", "construction workers", "farm workers"]'::jsonb),
('default_countries', '["United Arab Emirates", "United Kingdom", "Qatar", "Saudi Arabia", "New Zealand", "Canada", "Australia"]'::jsonb)
ON CONFLICT (key) DO NOTHING;
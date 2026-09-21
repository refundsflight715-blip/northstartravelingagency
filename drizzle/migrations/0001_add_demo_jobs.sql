-- =================================================================
-- NORTHSTAR TRAVELING AGENCY - DEMO JOBS SEED MIGRATION
-- 12 Sample Jobs Per Country (21 Countries = 252 Demo Jobs)
-- All entries clearly tagged with status = 'demo'
-- =================================================================

-- Step 1: Ensure status column accommodates demo, active, closed
DO $$
BEGIN
    ALTER TABLE public.jobs DROP CONSTRAINT IF EXISTS jobs_status_check;
    ALTER TABLE public.jobs ADD CONSTRAINT jobs_status_check
        CHECK (status IN ('demo', 'active', 'closed', 'draft', 'published'));
EXCEPTION WHEN OTHERS THEN
    NULL;
END $$;

-- Step 2: Remove any previous demo records before seeding
DELETE FROM public.jobs WHERE status = 'demo';

-- ==================== CANADA (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Caregiver — DEMO',
    'canada-caregiver-demo',
    'Caregiver',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Worker — DEMO',
    'canada-warehouse-worker-demo',
    'Warehouse Worker',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Cleaner — DEMO',
    'canada-cleaner-demo',
    'Cleaner',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Construction Worker — DEMO',
    'canada-construction-worker-demo',
    'Construction Worker',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeper — DEMO',
    'canada-hotel-housekeeper-demo',
    'Hotel Staff',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'canada-kitchen-assistant-demo',
    'Other Jobs',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Farm Worker — DEMO',
    'canada-farm-worker-demo',
    'Farm Worker',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Driver — DEMO',
    'canada-driver-demo',
    'Driver',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'canada-security-guard-demo',
    'Security Guard',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Welder — DEMO',
    'canada-welder-demo',
    'Other Jobs',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Assistant — DEMO',
    'canada-retail-assistant-demo',
    'Other Jobs',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Worker — DEMO',
    'canada-maintenance-worker-demo',
    'Other Jobs',
    'Canada',
    'Canada (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Canada. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== AUSTRALIA (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Farm Hand — DEMO',
    'australia-farm-hand-demo',
    'Farm Worker',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Steward — DEMO',
    'australia-kitchen-steward-demo',
    'Other Jobs',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'australia-commercial-cleaner-demo',
    'Cleaner',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Assistant — DEMO',
    'australia-warehouse-assistant-demo',
    'Warehouse Worker',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hospitality Waitstaff — DEMO',
    'australia-hospitality-waitstaff-demo',
    'Hotel Staff',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Solar Panel Installer — DEMO',
    'australia-solar-panel-installer-demo',
    'Construction Worker',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Officer — DEMO',
    'australia-security-officer-demo',
    'Security Guard',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Fruit Picker — DEMO',
    'australia-fruit-picker-demo',
    'Farm Worker',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Landscape Laborer — DEMO',
    'australia-landscape-laborer-demo',
    'Other Jobs',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Meat Packer — DEMO',
    'australia-meat-packer-demo',
    'Other Jobs',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Light Delivery Driver — DEMO',
    'australia-light-delivery-driver-demo',
    'Driver',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Care Assistant — DEMO',
    'australia-care-assistant-demo',
    'Caregiver',
    'Australia',
    'Australia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Australia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== NETHERLANDS (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Greenhouse Worker — DEMO',
    'netherlands-greenhouse-worker-demo',
    'Farm Worker',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Logistics Picker — DEMO',
    'netherlands-logistics-picker-demo',
    'Warehouse Worker',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Bicycle Courier — DEMO',
    'netherlands-bicycle-courier-demo',
    'Driver',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facility Cleaner — DEMO',
    'netherlands-facility-cleaner-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Porter — DEMO',
    'netherlands-kitchen-porter-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Attendant — DEMO',
    'netherlands-hotel-attendant-demo',
    'Hotel Staff',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Order Packer — DEMO',
    'netherlands-order-packer-demo',
    'Warehouse Worker',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Production Operator — DEMO',
    'netherlands-production-operator-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Forklift Assistant — DEMO',
    'netherlands-warehouse-forklift-assistant-demo',
    'Warehouse Worker',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Laborer — DEMO',
    'netherlands-general-laborer-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Supermarket Restocker — DEMO',
    'netherlands-supermarket-restocker-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Helper — DEMO',
    'netherlands-maintenance-helper-demo',
    'Other Jobs',
    'Netherlands',
    'Netherlands (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Netherlands. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== GERMANY (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Associate — DEMO',
    'germany-warehouse-associate-demo',
    'Warehouse Worker',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Room Attendant — DEMO',
    'germany-hotel-room-attendant-demo',
    'Hotel Staff',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facility Custodian — DEMO',
    'germany-facility-custodian-demo',
    'Cleaner',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Caregiving Assistant — DEMO',
    'germany-caregiving-assistant-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Helper — DEMO',
    'germany-kitchen-helper-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Parcel Sorter — DEMO',
    'germany-parcel-sorter-demo',
    'Warehouse Worker',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Assembly Line Operator — DEMO',
    'germany-assembly-line-operator-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Event Security Steward — DEMO',
    'germany-event-security-steward-demo',
    'Security Guard',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Bakery Production Worker — DEMO',
    'germany-bakery-production-worker-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Landscape Groundskeeper — DEMO',
    'germany-landscape-groundskeeper-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Construction Helper — DEMO',
    'germany-general-construction-helper-demo',
    'Construction Worker',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Airport Baggage Handler — DEMO',
    'germany-airport-baggage-handler-demo',
    'Other Jobs',
    'Germany',
    'Germany (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Germany. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== LUXEMBOURG (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Office Cleaner — DEMO',
    'luxembourg-office-cleaner-demo',
    'Cleaner',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Service Attendant — DEMO',
    'luxembourg-hotel-service-attendant-demo',
    'Hotel Staff',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Catering Assistant — DEMO',
    'luxembourg-catering-assistant-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Storekeeper — DEMO',
    'luxembourg-warehouse-storekeeper-demo',
    'Warehouse Worker',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Logistics Handler — DEMO',
    'luxembourg-logistics-handler-demo',
    'Warehouse Worker',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Grounds Maintenance Worker — DEMO',
    'luxembourg-grounds-maintenance-worker-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Server Assistant — DEMO',
    'luxembourg-restaurant-server-assistant-demo',
    'Waiter / Waitress',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Inventory Counter — DEMO',
    'luxembourg-inventory-counter-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Event Support Staff — DEMO',
    'luxembourg-event-support-staff-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facility Caretaker — DEMO',
    'luxembourg-facility-caretaker-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Domestic Helper — DEMO',
    'luxembourg-domestic-helper-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Package Sorter — DEMO',
    'luxembourg-package-sorter-demo',
    'Other Jobs',
    'Luxembourg',
    'Luxembourg (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Luxembourg. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== UNITED KINGDOM (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Care Assistant — DEMO',
    'united-kingdom-care-assistant-demo',
    'Caregiver',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Operative — DEMO',
    'united-kingdom-warehouse-operative-demo',
    'Warehouse Worker',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'united-kingdom-commercial-cleaner-demo',
    'Cleaner',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Porter — DEMO',
    'united-kingdom-kitchen-porter-demo',
    'Other Jobs',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Room Attendant — DEMO',
    'united-kingdom-hotel-room-attendant-demo',
    'Hotel Staff',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Delivery Driver — DEMO',
    'united-kingdom-delivery-driver-demo',
    'Driver',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Stock Assistant — DEMO',
    'united-kingdom-retail-stock-assistant-demo',
    'Other Jobs',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Officer — DEMO',
    'united-kingdom-security-officer-demo',
    'Security Guard',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Farm Hand — DEMO',
    'united-kingdom-general-farm-hand-demo',
    'Farm Worker',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Catering Assistant — DEMO',
    'united-kingdom-catering-assistant-demo',
    'Other Jobs',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Construction Laborer — DEMO',
    'united-kingdom-construction-laborer-demo',
    'Construction Worker',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facilities Assistant — DEMO',
    'united-kingdom-facilities-assistant-demo',
    'Other Jobs',
    'United Kingdom',
    'United Kingdom (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for United Kingdom. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== IRELAND (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Dairy Farm Worker — DEMO',
    'ireland-dairy-farm-worker-demo',
    'Farm Worker',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Care Support Worker — DEMO',
    'ireland-care-support-worker-demo',
    'Caregiver',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeper — DEMO',
    'ireland-hotel-housekeeper-demo',
    'Hotel Staff',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Picker — DEMO',
    'ireland-warehouse-picker-demo',
    'Warehouse Worker',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Porter — DEMO',
    'ireland-kitchen-porter-demo',
    'Other Jobs',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'ireland-security-guard-demo',
    'Security Guard',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Mushroom Harvester — DEMO',
    'ireland-mushroom-harvester-demo',
    'Farm Worker',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Cleaner — DEMO',
    'ireland-general-cleaner-demo',
    'Cleaner',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Meat Factory Operative — DEMO',
    'ireland-meat-factory-operative-demo',
    'Other Jobs',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Barista & Server Assistant — DEMO',
    'ireland-barista-server-assistant-demo',
    'Waiter / Waitress',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Site Construction Helper — DEMO',
    'ireland-site-construction-helper-demo',
    'Construction Worker',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Assistant — DEMO',
    'ireland-retail-assistant-demo',
    'Other Jobs',
    'Ireland',
    'Ireland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Ireland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== FRANCE (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Agricultural Harvester — DEMO',
    'france-agricultural-harvester-demo',
    'Farm Worker',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Cleaner — DEMO',
    'france-hotel-cleaner-demo',
    'Hotel Staff',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'france-kitchen-assistant-demo',
    'Other Jobs',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Sorter — DEMO',
    'france-warehouse-sorter-demo',
    'Warehouse Worker',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Vineyard Laborer — DEMO',
    'france-vineyard-laborer-demo',
    'Farm Worker',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Waitstaff — DEMO',
    'france-restaurant-waitstaff-demo',
    'Waiter / Waitress',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'france-security-guard-demo',
    'Security Guard',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Assistant — DEMO',
    'france-maintenance-assistant-demo',
    'Other Jobs',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Associate — DEMO',
    'france-retail-associate-demo',
    'Other Jobs',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Logistics Handler — DEMO',
    'france-logistics-handler-demo',
    'Warehouse Worker',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Office Custodian — DEMO',
    'france-office-custodian-demo',
    'Other Jobs',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hospitality Assistant — DEMO',
    'france-hospitality-assistant-demo',
    'Other Jobs',
    'France',
    'France (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for France. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== SWITZERLAND (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeping Staff — DEMO',
    'switzerland-hotel-housekeeping-staff-demo',
    'Hotel Staff',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Alpine Lodge Assistant — DEMO',
    'switzerland-alpine-lodge-assistant-demo',
    'Hotel Staff',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Steward — DEMO',
    'switzerland-kitchen-steward-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Logistics Worker — DEMO',
    'switzerland-warehouse-logistics-worker-demo',
    'Warehouse Worker',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Cleaning Specialist — DEMO',
    'switzerland-cleaning-specialist-demo',
    'Cleaner',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Agricultural Assistant — DEMO',
    'switzerland-agricultural-assistant-demo',
    'Farm Worker',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Landscape Groundskeeper — DEMO',
    'switzerland-landscape-groundskeeper-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Technician Helper — DEMO',
    'switzerland-maintenance-technician-helper-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Catering Attendant — DEMO',
    'switzerland-catering-attendant-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Inventory Associate — DEMO',
    'switzerland-inventory-associate-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Stocker — DEMO',
    'switzerland-retail-stocker-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Event Support Staff — DEMO',
    'switzerland-event-support-staff-demo',
    'Other Jobs',
    'Switzerland',
    'Switzerland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Switzerland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== MALTA (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Room Attendant — DEMO',
    'malta-hotel-room-attendant-demo',
    'Hotel Staff',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Waiter / Waitress — DEMO',
    'malta-restaurant-waiter-waitress-demo',
    'Other Jobs',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Porter — DEMO',
    'malta-kitchen-porter-demo',
    'Other Jobs',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'malta-security-guard-demo',
    'Security Guard',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facility Cleaner — DEMO',
    'malta-facility-cleaner-demo',
    'Other Jobs',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Helper — DEMO',
    'malta-warehouse-helper-demo',
    'Warehouse Worker',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Tourism Service Assistant — DEMO',
    'malta-tourism-service-assistant-demo',
    'Hotel Staff',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Construction Laborer — DEMO',
    'malta-construction-laborer-demo',
    'Construction Worker',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Delivery Courier — DEMO',
    'malta-delivery-courier-demo',
    'Driver',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Laundry Attendant — DEMO',
    'malta-laundry-attendant-demo',
    'Hotel Staff',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Shop Assistant — DEMO',
    'malta-retail-shop-assistant-demo',
    'Other Jobs',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Driver Assistant — DEMO',
    'malta-driver-assistant-demo',
    'Driver',
    'Malta',
    'Malta (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malta. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== UAE / DUBAI (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeper — DEMO',
    'uae-hotel-housekeeper-demo',
    'Hotel Staff',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Light Vehicle Driver — DEMO',
    'uae-light-vehicle-driver-demo',
    'Driver',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'uae-security-guard-demo',
    'Security Guard',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Building Cleaner — DEMO',
    'uae-building-cleaner-demo',
    'Cleaner',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'uae-kitchen-assistant-demo',
    'Other Jobs',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Waiter / Waitress — DEMO',
    'uae-waiter-waitress-demo',
    'Waiter / Waitress',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Helper — DEMO',
    'uae-warehouse-helper-demo',
    'Warehouse Worker',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Sales Associate — DEMO',
    'uae-retail-sales-associate-demo',
    'Other Jobs',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Airport Baggage Porter — DEMO',
    'uae-airport-baggage-porter-demo',
    'Other Jobs',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facilities Handyman — DEMO',
    'uae-facilities-handyman-demo',
    'Other Jobs',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Laundry Worker — DEMO',
    'uae-laundry-worker-demo',
    'Hotel Staff',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Construction Helper — DEMO',
    'uae-construction-helper-demo',
    'Construction Worker',
    'UAE / Dubai',
    'UAE / Dubai (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for UAE / Dubai. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== QATAR (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hospitality Attendant — DEMO',
    'qatar-hospitality-attendant-demo',
    'Hotel Staff',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facilities Cleaner — DEMO',
    'qatar-facilities-cleaner-demo',
    'Cleaner',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Shuttle Driver — DEMO',
    'qatar-shuttle-driver-demo',
    'Driver',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'qatar-security-guard-demo',
    'Security Guard',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Steward — DEMO',
    'qatar-kitchen-steward-demo',
    'Other Jobs',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Dining Room Server — DEMO',
    'qatar-dining-room-server-demo',
    'Hotel Staff',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Logistics Laborer — DEMO',
    'qatar-logistics-laborer-demo',
    'Warehouse Worker',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Helper — DEMO',
    'qatar-maintenance-helper-demo',
    'Other Jobs',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Storekeeper Assistant — DEMO',
    'qatar-storekeeper-assistant-demo',
    'Warehouse Worker',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Custodian — DEMO',
    'qatar-commercial-custodian-demo',
    'Other Jobs',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Laundry Attendant — DEMO',
    'qatar-laundry-attendant-demo',
    'Hotel Staff',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Construction Worker — DEMO',
    'qatar-general-construction-worker-demo',
    'Construction Worker',
    'Qatar',
    'Qatar (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Qatar. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== SAUDI ARABIA (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facilities Cleaner — DEMO',
    'saudi-arabia-facilities-cleaner-demo',
    'Cleaner',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Heavy / Light Driver — DEMO',
    'saudi-arabia-heavy-light-driver-demo',
    'Driver',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Catering & Kitchen Helper — DEMO',
    'saudi-arabia-catering-kitchen-helper-demo',
    'Other Jobs',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Attendant — DEMO',
    'saudi-arabia-hotel-attendant-demo',
    'Hotel Staff',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'saudi-arabia-security-guard-demo',
    'Security Guard',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Operator — DEMO',
    'saudi-arabia-warehouse-operator-demo',
    'Warehouse Worker',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Waiter — DEMO',
    'saudi-arabia-restaurant-waiter-demo',
    'Waiter / Waitress',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Handyman — DEMO',
    'saudi-arabia-maintenance-handyman-demo',
    'Other Jobs',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Mason / Construction Helper — DEMO',
    'saudi-arabia-mason-construction-helper-demo',
    'Construction Worker',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Merchandiser — DEMO',
    'saudi-arabia-retail-merchandiser-demo',
    'Other Jobs',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Domestic Care Assistant — DEMO',
    'saudi-arabia-domestic-care-assistant-demo',
    'Caregiver',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Airport Ground Handler — DEMO',
    'saudi-arabia-airport-ground-handler-demo',
    'Other Jobs',
    'Saudi Arabia',
    'Saudi Arabia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Saudi Arabia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== OMAN (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeping Staff — DEMO',
    'oman-hotel-housekeeping-staff-demo',
    'Hotel Staff',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Driver — DEMO',
    'oman-commercial-driver-demo',
    'Driver',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Building Custodian — DEMO',
    'oman-building-custodian-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Helper — DEMO',
    'oman-kitchen-helper-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'oman-security-guard-demo',
    'Security Guard',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Server — DEMO',
    'oman-restaurant-server-demo',
    'Waiter / Waitress',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Technician Helper — DEMO',
    'oman-maintenance-technician-helper-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Sorter — DEMO',
    'oman-warehouse-sorter-demo',
    'Warehouse Worker',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Supermarket Assistant — DEMO',
    'oman-supermarket-assistant-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facilities Worker — DEMO',
    'oman-facilities-worker-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Landscape Laborer — DEMO',
    'oman-landscape-laborer-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Helper — DEMO',
    'oman-general-helper-demo',
    'Other Jobs',
    'Oman',
    'Oman (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Oman. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== BAHRAIN (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Waiter — DEMO',
    'bahrain-restaurant-waiter-demo',
    'Waiter / Waitress',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Room Cleaner — DEMO',
    'bahrain-hotel-room-cleaner-demo',
    'Other Jobs',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Delivery Driver — DEMO',
    'bahrain-delivery-driver-demo',
    'Driver',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'bahrain-security-guard-demo',
    'Security Guard',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Steward — DEMO',
    'bahrain-kitchen-steward-demo',
    'Other Jobs',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Sales Assistant — DEMO',
    'bahrain-retail-sales-assistant-demo',
    'Other Jobs',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Laborer — DEMO',
    'bahrain-warehouse-laborer-demo',
    'Warehouse Worker',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Office Boy / Cleaner — DEMO',
    'bahrain-office-boy-cleaner-demo',
    'Cleaner',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Assistant — DEMO',
    'bahrain-maintenance-assistant-demo',
    'Other Jobs',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Laundry Attendant — DEMO',
    'bahrain-laundry-attendant-demo',
    'Hotel Staff',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hospitality Host — DEMO',
    'bahrain-hospitality-host-demo',
    'Hotel Staff',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Store Helper — DEMO',
    'bahrain-store-helper-demo',
    'Other Jobs',
    'Bahrain',
    'Bahrain (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Bahrain. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== KUWAIT (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Domestic Worker — DEMO',
    'kuwait-domestic-worker-demo',
    'Other Jobs',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen & Catering Assistant — DEMO',
    'kuwait-kitchen-catering-assistant-demo',
    'Other Jobs',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Light Vehicle Driver — DEMO',
    'kuwait-light-vehicle-driver-demo',
    'Driver',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'kuwait-commercial-cleaner-demo',
    'Cleaner',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'kuwait-security-guard-demo',
    'Security Guard',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Attendant — DEMO',
    'kuwait-hotel-attendant-demo',
    'Hotel Staff',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Storer — DEMO',
    'kuwait-warehouse-storer-demo',
    'Warehouse Worker',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Supermarket Cashier Assistant — DEMO',
    'kuwait-supermarket-cashier-assistant-demo',
    'Other Jobs',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Worker — DEMO',
    'kuwait-maintenance-worker-demo',
    'Other Jobs',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Server — DEMO',
    'kuwait-restaurant-server-demo',
    'Waiter / Waitress',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Laundry Worker — DEMO',
    'kuwait-laundry-worker-demo',
    'Hotel Staff',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Laborer — DEMO',
    'kuwait-general-laborer-demo',
    'Other Jobs',
    'Kuwait',
    'Kuwait (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Kuwait. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== MALAYSIA (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Manufacturing Production Operator — DEMO',
    'malaysia-manufacturing-production-operator-demo',
    'Other Jobs',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeper — DEMO',
    'malaysia-hotel-housekeeper-demo',
    'Hotel Staff',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Plantation / Farm Laborer — DEMO',
    'malaysia-plantation-farm-laborer-demo',
    'Farm Worker',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'malaysia-kitchen-assistant-demo',
    'Other Jobs',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'malaysia-commercial-cleaner-demo',
    'Cleaner',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Sorter — DEMO',
    'malaysia-warehouse-sorter-demo',
    'Warehouse Worker',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Service Crew — DEMO',
    'malaysia-restaurant-service-crew-demo',
    'Waiter / Waitress',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'malaysia-security-guard-demo',
    'Security Guard',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Delivery Rider — DEMO',
    'malaysia-delivery-rider-demo',
    'Driver',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Assistant — DEMO',
    'malaysia-maintenance-assistant-demo',
    'Other Jobs',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Assistant — DEMO',
    'malaysia-retail-assistant-demo',
    'Other Jobs',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Factory Worker — DEMO',
    'malaysia-general-factory-worker-demo',
    'Other Jobs',
    'Malaysia',
    'Malaysia (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Malaysia. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== MAURITIUS (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Resort Housekeeper — DEMO',
    'mauritius-resort-housekeeper-demo',
    'Hotel Staff',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Waitstaff — DEMO',
    'mauritius-hotel-waitstaff-demo',
    'Waiter / Waitress',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Porter — DEMO',
    'mauritius-kitchen-porter-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Assistant — DEMO',
    'mauritius-maintenance-assistant-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'mauritius-security-guard-demo',
    'Security Guard',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Textile Production Worker — DEMO',
    'mauritius-textile-production-worker-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'mauritius-commercial-cleaner-demo',
    'Cleaner',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Agricultural Hand — DEMO',
    'mauritius-agricultural-hand-demo',
    'Farm Worker',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Assistant — DEMO',
    'mauritius-retail-assistant-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Loader — DEMO',
    'mauritius-warehouse-loader-demo',
    'Warehouse Worker',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Food Service Crew — DEMO',
    'mauritius-food-service-crew-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Groundskeeper — DEMO',
    'mauritius-groundskeeper-demo',
    'Other Jobs',
    'Mauritius',
    'Mauritius (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Mauritius. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== NEW ZEALAND (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Horticulture / Orchard Worker — DEMO',
    'new-zealand-horticulture-orchard-worker-demo',
    'Farm Worker',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Dairy Farm Assistant — DEMO',
    'new-zealand-dairy-farm-assistant-demo',
    'Farm Worker',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Room Attendant — DEMO',
    'new-zealand-hotel-room-attendant-demo',
    'Hotel Staff',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'new-zealand-commercial-cleaner-demo',
    'Cleaner',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Hand — DEMO',
    'new-zealand-kitchen-hand-demo',
    'Other Jobs',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Storeperson — DEMO',
    'new-zealand-warehouse-storeperson-demo',
    'Warehouse Worker',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Vineyard Worker — DEMO',
    'new-zealand-vineyard-worker-demo',
    'Farm Worker',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hospitality Server — DEMO',
    'new-zealand-hospitality-server-demo',
    'Other Jobs',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Construction Laborer — DEMO',
    'new-zealand-construction-laborer-demo',
    'Construction Worker',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Delivery Driver — DEMO',
    'new-zealand-delivery-driver-demo',
    'Driver',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Packhouse Grader — DEMO',
    'new-zealand-packhouse-grader-demo',
    'Other Jobs',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Officer — DEMO',
    'new-zealand-security-officer-demo',
    'Security Guard',
    'New Zealand',
    'New Zealand (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for New Zealand. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== TURKEY (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeping Staff — DEMO',
    'turkey-hotel-housekeeping-staff-demo',
    'Hotel Staff',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'turkey-kitchen-assistant-demo',
    'Other Jobs',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Restaurant Waiter — DEMO',
    'turkey-restaurant-waiter-demo',
    'Waiter / Waitress',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Textile Factory Worker — DEMO',
    'turkey-textile-factory-worker-demo',
    'Other Jobs',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'turkey-commercial-cleaner-demo',
    'Cleaner',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Sorter — DEMO',
    'turkey-warehouse-sorter-demo',
    'Warehouse Worker',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Associate — DEMO',
    'turkey-retail-associate-demo',
    'Other Jobs',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Security Guard — DEMO',
    'turkey-security-guard-demo',
    'Security Guard',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Tourism Transport Driver — DEMO',
    'turkey-tourism-transport-driver-demo',
    'Driver',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Helper — DEMO',
    'turkey-maintenance-helper-demo',
    'Other Jobs',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Agricultural Harvester — DEMO',
    'turkey-agricultural-harvester-demo',
    'Farm Worker',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Facility Custodian — DEMO',
    'turkey-facility-custodian-demo',
    'Cleaner',
    'Turkey',
    'Turkey (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Turkey. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

-- ==================== POLAND (12 DEMO JOBS) ====================
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Warehouse Order Picker — DEMO',
    'poland-warehouse-order-picker-demo',
    'Warehouse Worker',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Food Processing Operator — DEMO',
    'poland-food-processing-operator-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Hotel Housekeeper — DEMO',
    'poland-hotel-housekeeper-demo',
    'Hotel Staff',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Factory Assembly Worker — DEMO',
    'poland-factory-assembly-worker-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Commercial Cleaner — DEMO',
    'poland-commercial-cleaner-demo',
    'Cleaner',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Kitchen Assistant — DEMO',
    'poland-kitchen-assistant-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Forklift Helper — DEMO',
    'poland-forklift-helper-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Agricultural Sorter — DEMO',
    'poland-agricultural-sorter-demo',
    'Farm Worker',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'General Construction Worker — DEMO',
    'poland-general-construction-worker-demo',
    'Construction Worker',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Logistics Handler — DEMO',
    'poland-logistics-handler-demo',
    'Warehouse Worker',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Retail Stocker — DEMO',
    'poland-retail-stocker-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);
INSERT INTO public.jobs (
    title, slug, category, country, location, description, requirements,
    status, job_type, featured, vacancies, posted_at, created_at, updated_at
) VALUES (
    'Maintenance Assistant — DEMO',
    'poland-maintenance-assistant-demo',
    'Other Jobs',
    'Poland',
    'Poland (Demo Placeholder)',
    'DEMO VACANCY — NOT A VERIFIED JOB. This entry is a placeholder to demonstrate the portal layout, filter categories, search indexing, and application flow for Poland. It does not represent an active recruitment call, verified employer order, or immigration sponsorship.',
    'DEMO VACANCY — NOT A VERIFIED JOB. For layout and functional testing only. No actual employment qualification, work visa sponsorship, or guaranteed placement applies to this demo listing.',
    'demo',
    'full-time',
    false,
    1,
    NOW(),
    NOW(),
    NOW()
);

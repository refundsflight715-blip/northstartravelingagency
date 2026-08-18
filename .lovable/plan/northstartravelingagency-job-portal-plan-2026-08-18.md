# NorthStarTravelingAgency Job Portal Plan

## Goal
Build a job portal for NorthStarTravelingAgency that connects overseas job seekers with recruitment opportunities and lets agency staff manage listings, applications, and platform settings.

## Visual Direction
- Primary palette: green and bright red accents on a clean light background.
- Trustworthy, human-centric feel suitable for recruitment and travel services.
- Responsive design that works on mobile and desktop.

## Backend Foundation
- Enable Lovable Cloud for database, authentication, and server-side logic.
- Core tables:
  - `jobs` — active overseas job postings (title, location, category, description, requirements, salary, status, posted/expires dates).
  - `applications` — candidate submissions linked to a job and a user (status, documents, notes, timestamps).
  - `profiles` — extended user info (phone, country, resume_url, role).
  - `user_roles` — role-based access (`candidate`, `employer`, `admin`) using a separate roles table.
  - `audit_logs` — track key admin and candidate events for the backend portal.
- Row Level Security (RLS) on all tables with proper grants and policies.
- Auth flow: sign up / log in for candidates and admins; employer access can be invite-only admin-created accounts initially.

## Public Site
Replace the placeholder home page and add shareable marketing routes:
- `/` — landing page with hero, service highlights, featured jobs, and call-to-action.
- `/services` — overview of overseas jobs, document guidance, visa/travel help, accommodation support.
- `/about` — agency story and trust signals.
- `/contact` — inquiry form for employers and general questions.
- `/jobs` — browsable job listings with filters (category, country, job type).
- `/jobs/$id` — detailed job page with apply button.
- `/apply/$jobId` — public application form (requires login or prompts sign up).

## Candidate Experience
- `/auth` — login and sign up page.
- `/_authenticated/dashboard` — candidate dashboard showing applied jobs and application status.
- `/_authenticated/profile` — edit profile and upload resume.

## Admin & Configuration Portal
- `/_authenticated/admin/dashboard` — overview stats (jobs, applications, users).
- `/_authenticated/admin/jobs` — create, edit, publish/unpublish jobs.
- `/_authenticated/admin/applications` — review applications, update status, add notes.
- `/_authenticated/admin/users` — manage users and assign roles.
- `/_authenticated/admin/settings` — platform configuration (categories, countries, application statuses).
- `/_authenticated/admin/audit-logs` — view event history for tracking actions.

## Employer Section (Phase 1)
- `/employers` — public landing explaining how employers partner with the agency.
- `/contact?type=employer` — dedicated employer inquiry form.
- Admin can later upgrade a user to the `employer` role to access employer-specific dashboards.

## Technical Notes
- Built on TanStack Start with server functions for secure backend operations.
- Use `createServerFn` for job/application CRUD and admin actions.
- Authenticated routes live under the `_authenticated` layout.
- Zod validation on all server function inputs.
- Route-specific `head()` metadata for SEO on every public page.
- Toast notifications via sonner for user feedback.

# Roadmap

## In progress
- [x] Jobs browsing: country categories, category/type filters, browse all, richer job cards
- [x] "Your Questions Answered" FAQ accordion (editable in src/lib/faqs.ts)
- [x] Application form: applicant name/phone/email/country + confirmation screen
- [x] Admin applications: contact details + new statuses (New → Completed)
- [ ] Fix missing `Users` icon import in src/routes/jobs.$id.tsx

## New request (2026-09-18)
- [ ] Migration: add 8 nullable job detail columns (required_experience, qualifications, responsibilities, accommodation, transport, medical_coverage, contract_duration, visa_info); delete the 5 demo job rows
- [ ] schemas.ts: 8 optional fields on jobSchema
- [ ] jobs.functions.ts: pass fields through; extend search to qualifications + responsibilities
- [ ] admin/jobs.tsx: "Additional details" form section
- [ ] job-card.tsx: show contract duration / accommodation when present
- [ ] jobs.$id.tsx: conditional detail sections

## Blocked
- [ ] Email notification to the agency + applicant confirmation email — needs a sender domain the user owns

# Roadmap

## Done
- [x] Jobs browsing: country categories, category/type filters, browse all, richer job cards
- [x] "Your Questions Answered" FAQ accordion (editable in src/lib/faqs.ts)
- [x] Application form: applicant name/phone/email/country + confirmation screen
- [x] Admin applications: contact details + new statuses (New → Completed)
- [x] Fix missing `Users` icon import in src/routes/jobs.$id.tsx
- [x] Migration: 8 nullable job detail columns; removed the 5 demo job rows
- [x] schemas.ts: 8 optional fields on jobSchema
- [x] jobs.functions.ts: fields passed through; search extended to qualifications + responsibilities
- [x] admin/jobs.tsx: "Additional details" form section
- [x] job-card.tsx: contract duration / accommodation shown when present
- [x] jobs.$id.tsx: conditional detail sections

## Blocked
- [ ] Email notification to the agency + applicant confirmation email — needs a sender domain the user owns

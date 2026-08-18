import { z } from "zod";

export const jobStatusSchema = z.enum(["draft", "published", "closed"]);
export const applicationStatusSchema = z.enum([
  "pending",
  "reviewing",
  "shortlisted",
  "rejected",
  "hired",
]);
export const appRoleSchema = z.enum(["candidate", "employer", "admin"]);

export const jobSchema = z.object({
  title: z.string().min(2, "Title is required"),
  category: z.string().min(1, "Category is required"),
  country: z.string().min(1, "Country is required"),
  location: z.string().optional(),
  description: z.string().min(10, "Description must be at least 10 characters"),
  requirements: z.string().min(10, "Requirements must be at least 10 characters"),
  salary: z.string().optional(),
  job_type: z.string().default("full-time"),
  status: jobStatusSchema.default("draft"),
  featured: z.boolean().default(false),
  expires_at: z.string().optional(),
});

export const applicationSchema = z.object({
  job_id: z.string().uuid("Invalid job"),
  cover_letter: z.string().min(10, "Cover letter must be at least 10 characters"),
});

export const applicationStatusUpdateSchema = z.object({
  id: z.string().uuid(),
  status: applicationStatusSchema,
  admin_notes: z.string().optional(),
});

export const profileSchema = z.object({
  full_name: z.string().min(2, "Full name is required"),
  phone: z.string().optional(),
  country: z.string().optional(),
  bio: z.string().optional(),
  resume_url: z.string().url().optional().or(z.literal("")),
});

export const contactSchema = z.object({
  name: z.string().min(2, "Name is required"),
  email: z.string().email("Valid email is required"),
  phone: z.string().optional(),
  subject: z.string().min(2, "Subject is required"),
  message: z.string().min(10, "Message must be at least 10 characters"),
});

export type JobInput = z.infer<typeof jobSchema>;
export type ApplicationInput = z.infer<typeof applicationSchema>;
export type ApplicationStatusUpdateInput = z.infer<typeof applicationStatusUpdateSchema>;
export type ProfileInput = z.infer<typeof profileSchema>;
export type ContactInput = z.infer<typeof contactSchema>;

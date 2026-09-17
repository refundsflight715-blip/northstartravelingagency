import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useState, useEffect } from "react";
import { Plus, Pencil, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { getAllJobs, createJob, updateJob, deleteJob } from "@/lib/jobs.functions";
import { jobSchema, type JobInput } from "@/lib/schemas";
import { z } from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { useServerFn } from "@tanstack/react-start";
import { toast } from "sonner";
import type { Database } from "@/integrations/supabase/types";
import { jobCategories, jobCountries, employmentTypes } from "@/lib/site";

const adminJobFormSchema = z.object({
  title: z.string().min(2, "Title is required"),
  category: z.string().min(1, "Category is required"),
  country: z.string().min(1, "Country is required"),
  location: z.string().optional(),
  description: z.string().min(10, "Description must be at least 10 characters"),
  requirements: z.string().min(10, "Requirements must be at least 10 characters"),
  salary: z.string().optional(),
  vacancies: z.string().optional(),
  job_type: z.string().optional(),
  status: z.enum(["draft", "published", "closed"]).optional(),
  featured: z.boolean().optional(),
  expires_at: z.string().optional(),
});

type AdminJobFormValues = z.infer<typeof adminJobFormSchema>;

type JobRow = Database["public"]["Tables"]["jobs"]["Row"];

const adminJobsQueryOptions = queryOptions({
  queryKey: ["admin-jobs"],
  queryFn: () => getAllJobs(),
});

export const Route = createFileRoute("/_authenticated/admin/jobs")({
  head: () => ({
    meta: [
      { title: "Manage Jobs | NorthStar Admin" },
      { name: "description", content: "Manage job listings." },
      { property: "og:title", content: "Manage Jobs | NorthStar Admin" },
      { property: "og:description", content: "Manage job listings." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(adminJobsQueryOptions),
  component: AdminJobsPage,
});

const defaultValues: AdminJobFormValues = {
  title: "",
  category: "",
  country: "",
  location: "",
  description: "",
  requirements: "",
  salary: "",
  vacancies: "",
  job_type: "full-time",
  status: "draft",
  featured: false,
  expires_at: "",
};

function AdminJobsPage() {
  const { data: jobs, refetch } = useSuspenseQuery(adminJobsQueryOptions);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [open, setOpen] = useState(false);
  const createFn = useServerFn(createJob);
  const updateFn = useServerFn(updateJob);
  const deleteFn = useServerFn(deleteJob);

  const {
    register,
    handleSubmit,
    reset,
    formState: { errors, isSubmitting },
  } = useForm<AdminJobFormValues>({
    resolver: zodResolver(adminJobFormSchema),
    defaultValues,
  });

  useEffect(() => {
    if (!open) return;
    if (editingId) {
      const job = jobs.find((j) => j.id === editingId);
      if (job) {
        reset({
          title: job.title,
          category: job.category,
          country: job.country,
          location: job.location ?? "",
          description: job.description,
          requirements: job.requirements,
          salary: job.salary ?? "",
          vacancies: job.vacancies != null ? String(job.vacancies) : "",
          job_type: (job.job_type as AdminJobFormValues["job_type"]) ?? "full-time",
          status: (job.status as AdminJobFormValues["status"]) ?? "draft",
          featured: job.featured ?? false,
          expires_at: job.expires_at ?? "",
        });
      }
    } else {
      reset(defaultValues);
    }
  }, [open, editingId, jobs, reset]);

  const onSubmit = async (values: AdminJobFormValues) => {
    try {
      const payload: JobInput = {
        title: values.title,
        category: values.category,
        country: values.country,
        location: values.location,
        description: values.description,
        requirements: values.requirements,
        salary: values.salary,
        vacancies: values.vacancies ? Number(values.vacancies) : undefined,
        job_type: values.job_type || "full-time",
        status: (values.status as JobInput["status"]) || "draft",
        featured: values.featured ?? false,
        expires_at: values.expires_at,
      };
      if (editingId) {
        await updateFn({ data: { ...payload, id: editingId } });
        toast.success("Job updated.");
      } else {
        await createFn({ data: payload });
        toast.success("Job created.");
      }
      setOpen(false);
      setEditingId(null);
      reset(defaultValues);
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to save job.");
    }
  };

  const handleDelete = async (id: string) => {
    if (!confirm("Delete this job?")) return;
    try {
      await deleteFn({ data: { id } });
      toast.success("Job deleted.");
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to delete job.");
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-2xl font-bold text-foreground">Jobs</h2>
        <Dialog open={open} onOpenChange={setOpen}>
          <DialogTrigger asChild>
            <Button
              onClick={() => {
                setEditingId(null);
                reset(defaultValues);
              }}
            >
              <Plus className="mr-2 h-4 w-4" />
              Add job
            </Button>
          </DialogTrigger>
          <DialogContent className="max-h-[90vh] max-w-2xl overflow-y-auto">
            <DialogHeader>
              <DialogTitle>{editingId ? "Edit job" : "Create job"}</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-2">
                  <Label>Title</Label>
                  <Input {...register("title")} />
                  {errors.title && <p className="text-sm text-destructive">{errors.title.message}</p>}
                </div>
                <div className="space-y-2">
                  <Label>Category</Label>
                  <Input list="admin-job-categories" {...register("category")} />
                  <datalist id="admin-job-categories">
                    {jobCategories.map((c) => (
                      <option key={c} value={c} />
                    ))}
                  </datalist>
                  {errors.category && <p className="text-sm text-destructive">{errors.category.message}</p>}
                </div>
              </div>
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-2">
                  <Label>Country</Label>
                  <Input list="admin-job-countries" {...register("country")} />
                  <datalist id="admin-job-countries">
                    {jobCountries.map((c) => (
                      <option key={c} value={c} />
                    ))}
                  </datalist>
                </div>
                <div className="space-y-2">
                  <Label>Location</Label>
                  <Input {...register("location")} />
                </div>
              </div>
              <div className="grid gap-4 sm:grid-cols-3">
                <div className="space-y-2">
                  <Label>Salary (optional)</Label>
                  <Input {...register("salary")} />
                </div>
                <div className="space-y-2">
                  <Label>Vacancies (optional)</Label>
                  <Input type="number" min={1} {...register("vacancies")} />
                </div>
                <div className="space-y-2">
                  <Label>Employment type</Label>
                  <Input list="admin-job-types" {...register("job_type")} />
                  <datalist id="admin-job-types">
                    {employmentTypes.map((t) => (
                      <option key={t} value={t} />
                    ))}
                  </datalist>
                </div>
              </div>
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-2">
                  <Label>Status</Label>
                  <select className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm" {...register("status")}>
                    <option value="draft">Draft</option>
                    <option value="published">Published</option>
                    <option value="closed">Closed</option>
                  </select>
                </div>
                <div className="space-y-2">
                  <Label>Expires at</Label>
                  <Input type="date" {...register("expires_at")} />
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="featured" {...register("featured")} />
                <Label htmlFor="featured">Featured</Label>
              </div>
              <div className="space-y-2">
                <Label>Description</Label>
                <Textarea rows={4} {...register("description")} />
                {errors.description && <p className="text-sm text-destructive">{errors.description.message}</p>}
              </div>
              <div className="space-y-2">
                <Label>Requirements</Label>
                <Textarea rows={4} {...register("requirements")} />
                {errors.requirements && <p className="text-sm text-destructive">{errors.requirements.message}</p>}
              </div>
              <Button type="submit" className="w-full" disabled={isSubmitting}>
                {isSubmitting ? "Saving..." : "Save job"}
              </Button>
            </form>
          </DialogContent>
        </Dialog>
      </div>

      <div className="grid gap-4">
        {jobs.map((job: JobRow) => (
          <Card key={job.id}>
            <CardContent className="flex flex-col justify-between gap-4 py-4 sm:flex-row sm:items-center">
              <div>
                <h3 className="font-semibold text-foreground">{job.title}</h3>
                <p className="text-sm text-muted-foreground">
                  {job.category} &middot; {job.country} &middot; {job.status}
                </p>
              </div>
              <div className="flex items-center gap-2">
                <Badge variant={job.status === "published" ? "default" : "secondary"}>{job.status}</Badge>
                {job.featured && <Badge className="bg-accent text-accent-foreground">Featured</Badge>}
                <Button
                  variant="ghost"
                  size="icon"
                  onClick={() => {
                    setEditingId(job.id);
                    setOpen(true);
                  }}
                >
                  <Pencil className="h-4 w-4" />
                </Button>
                <Button variant="ghost" size="icon" onClick={() => handleDelete(job.id)}>
                  <Trash2 className="h-4 w-4 text-destructive" />
                </Button>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}

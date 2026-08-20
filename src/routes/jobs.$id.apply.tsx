import { createFileRoute, Link, redirect } from "@tanstack/react-router";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { applicationSchema, type ApplicationInput } from "@/lib/schemas";
import { getJobById } from "@/lib/jobs.functions";
import { createApplication } from "@/lib/applications.functions";
import { useServerFn } from "@tanstack/react-start";
import { toast } from "sonner";

const jobQueryOptions = (id: string) =>
  queryOptions({
    queryKey: ["job", id],
    queryFn: () => getJobById({ data: { id } }),
  });

export const Route = createFileRoute("/jobs/$id/apply")({
  head: () => ({
    meta: [
      { title: "Apply for Job | NorthStarAgency" },
      {
        name: "description",
        content: "Submit your application for an overseas job with NorthStarAgency.",
      },
      { property: "og:title", content: "Apply for Job | NorthStarAgency" },
      {
        property: "og:description",
        content: "Submit your application for an overseas job.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  beforeLoad: async ({ context }) => {
    const {
      data: { session },
    } = await context.queryClient.fetchQuery({
      queryKey: ["session"],
      queryFn: () => import("@/integrations/supabase/client").then((m) => m.supabase.auth.getSession()),
    });
    if (!session) throw redirect({ to: "/auth", search: { next: window.location.pathname } });
  },
  loader: async ({ context, params }) => {
    const job = await context.queryClient.ensureQueryData(jobQueryOptions(params.id));
    return job;
  },
  component: ApplyPage,
});

function ApplyPage() {
  const { id } = Route.useParams();
  const { data: job } = useSuspenseQuery(jobQueryOptions(id));
  const applyFn = useServerFn(createApplication);

  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<ApplicationInput>({
    resolver: zodResolver(applicationSchema),
    defaultValues: { job_id: id },
  });

  const onSubmit = async (values: ApplicationInput) => {
    try {
      await applyFn({ data: values });
      toast.success("Application submitted successfully.");
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to submit application.");
    }
  };

  return (
    <div className="container mx-auto max-w-2xl px-4 py-16 md:py-24">
      <Button variant="ghost" size="sm" className="mb-6" asChild>
        <Link to="/jobs/$id" params={{ id }}>
          <ArrowLeft className="mr-2 h-4 w-4" />
          Back to job
        </Link>
      </Button>

      <Card>
        <CardHeader>
          <h1 className="text-2xl font-bold text-foreground">Apply for {job.title}</h1>
          <p className="text-sm text-muted-foreground">
            Complete the form below to submit your application.
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <input type="hidden" {...register("job_id")} />
            <div className="space-y-2">
              <Label htmlFor="cover_letter">Cover letter</Label>
              <Textarea
                id="cover_letter"
                rows={8}
                placeholder="Tell us why you are a good fit for this role..."
                {...register("cover_letter")}
              />
              {errors.cover_letter && (
                <p className="text-sm text-destructive">{errors.cover_letter.message}</p>
              )}
            </div>
            <Button type="submit" className="w-full" disabled={isSubmitting}>
              {isSubmitting ? "Submitting..." : "Submit application"}
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}

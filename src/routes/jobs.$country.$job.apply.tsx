import { createFileRoute, Link, notFound, redirect } from "@tanstack/react-router";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useState } from "react";
import { CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { Notice } from "@/components/notice";
import { applicationSchema, type ApplicationInput } from "@/lib/schemas";
import { getJobBySlug } from "@/lib/jobs.functions";
import { createApplication } from "@/lib/applications.functions";
import {
  applicationNotice,
  site,
  jobCountries,
  getCountryBySlug,
  getCountryForJobCountryValue,
} from "@/lib/site";
import { useServerFn } from "@tanstack/react-start";
import { toast } from "sonner";

const jobQueryOptions = (slug: string) =>
  queryOptions({
    queryKey: ["job-by-slug", slug],
    queryFn: () => getJobBySlug({ data: { job_slug: slug } }),
  });

export const Route = createFileRoute("/jobs/$country/$job/apply")({
  head: () => ({
    meta: [
      { title: `Apply for a Job | ${site.shortName}` },
      {
        name: "description",
        content: "Submit your application for an overseas opportunity with NorthStarAgency.",
      },
      { property: "og:title", content: `Apply for a Job | ${site.shortName}` },
      {
        property: "og:description",
        content: "Submit your application for an overseas opportunity.",
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
      queryFn: () =>
        import("@/integrations/supabase/client").then((m) => m.supabase.auth.getSession()),
    });
    if (!session) throw redirect({ to: "/auth", search: { next: window.location.pathname } });
  },
  loader: async ({ context, params }) => {
    const country = getCountryBySlug(params.country);
    if (!country) throw notFound();
    const job = await context.queryClient.ensureQueryData(jobQueryOptions(params.job));
    if (!job) throw notFound();
    if (getCountryForJobCountryValue(job.country)?.slug !== country.slug) throw notFound();
    return job;
  },
  component: ApplyPage,
});

function ApplyPage() {
  const params = Route.useParams();
  const country = getCountryBySlug(params.country)!;
  const { data } = useSuspenseQuery(jobQueryOptions(params.job));
  const job = data!;
  const applyFn = useServerFn(createApplication);
  const [submitted, setSubmitted] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<ApplicationInput>({
    resolver: zodResolver(applicationSchema),
    defaultValues: { job_id: job.id, applicant_country: "" },
  });

  const onSubmit = async (values: ApplicationInput) => {
    try {
      await applyFn({ data: values });
      setSubmitted(true);
      toast.success("Application received.");
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to submit application.");
    }
  };

  if (submitted) {
    return (
      <div className="container mx-auto max-w-2xl px-4 py-16 md:py-24">
        <Card>
          <CardContent className="space-y-4 py-10 text-center">
            <CheckCircle2 className="mx-auto h-12 w-12 text-primary" />
            <h1 className="font-display text-2xl font-bold text-foreground">
              Application received
            </h1>
            <p className="text-muted-foreground">
              Thank you for submitting your application to {site.name}. Your application has been
              received successfully. Our team will review the information provided and contact you
              using the details submitted.
            </p>
            <Notice>{applicationNotice}</Notice>
            <div className="flex flex-wrap justify-center gap-3 pt-2">
              <Button asChild>
                <Link to="/dashboard">View my applications</Link>
              </Button>
              <Button variant="outline" asChild>
                <Link to="/jobs">Browse more jobs</Link>
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="container mx-auto max-w-2xl px-4 py-14 md:py-20">
      <Breadcrumb>
        <BreadcrumbList>
          <BreadcrumbItem>
            <BreadcrumbLink asChild>
              <Link to="/">Home</Link>
            </BreadcrumbLink>
          </BreadcrumbItem>
          <BreadcrumbSeparator />
          <BreadcrumbItem>
            <BreadcrumbLink asChild>
              <Link to="/jobs">Jobs Opportunities</Link>
            </BreadcrumbLink>
          </BreadcrumbItem>
          <BreadcrumbSeparator />
          <BreadcrumbItem>
            <BreadcrumbLink asChild>
              <Link to="/jobs/$country" params={{ country: country.slug }}>
                {country.name}
              </Link>
            </BreadcrumbLink>
          </BreadcrumbItem>
          <BreadcrumbSeparator />
          <BreadcrumbItem>
            <BreadcrumbLink asChild>
              <Link to="/jobs/$country/$job" params={params}>
                {job.title}
              </Link>
            </BreadcrumbLink>
          </BreadcrumbItem>
          <BreadcrumbSeparator />
          <BreadcrumbItem>
            <BreadcrumbPage>Apply</BreadcrumbPage>
          </BreadcrumbItem>
        </BreadcrumbList>
      </Breadcrumb>

      <Card className="mt-8">
        <CardHeader>
          <h1 className="font-display text-2xl font-bold text-foreground">
            Apply for {job.title}
          </h1>
          <p className="text-sm text-muted-foreground">
            Selected job: {job.title} — Country: {job.country}
            {job.location ? `, ${job.location}` : ""}
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <input type="hidden" {...register("job_id")} />

            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label htmlFor="applicant_name">Full name</Label>
                <Input id="applicant_name" autoComplete="name" {...register("applicant_name")} />
                {errors.applicant_name && (
                  <p className="text-sm text-destructive">{errors.applicant_name.message}</p>
                )}
              </div>
              <div className="space-y-2">
                <Label htmlFor="applicant_phone">Phone number</Label>
                <Input
                  id="applicant_phone"
                  type="tel"
                  autoComplete="tel"
                  placeholder="+254..."
                  {...register("applicant_phone")}
                />
                {errors.applicant_phone && (
                  <p className="text-sm text-destructive">{errors.applicant_phone.message}</p>
                )}
              </div>
              <div className="space-y-2">
                <Label htmlFor="applicant_email">Email address</Label>
                <Input
                  id="applicant_email"
                  type="email"
                  autoComplete="email"
                  {...register("applicant_email")}
                />
                {errors.applicant_email && (
                  <p className="text-sm text-destructive">{errors.applicant_email.message}</p>
                )}
              </div>
              <div className="space-y-2">
                <Label htmlFor="applicant_country">Country you are applying from</Label>
                <Input
                  id="applicant_country"
                  list="applicant-country-options"
                  autoComplete="country-name"
                  {...register("applicant_country")}
                />
                <datalist id="applicant-country-options">
                  <option value="Kenya" />
                  {jobCountries.map((c) => (
                    <option key={c} value={c} />
                  ))}
                </datalist>
                {errors.applicant_country && (
                  <p className="text-sm text-destructive">{errors.applicant_country.message}</p>
                )}
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="cover_letter">About you</Label>
              <Textarea
                id="cover_letter"
                rows={8}
                placeholder="Share your experience, skills and availability for this role..."
                {...register("cover_letter")}
              />
              {errors.cover_letter && (
                <p className="text-sm text-destructive">{errors.cover_letter.message}</p>
              )}
            </div>

            <Notice>{applicationNotice}</Notice>

            <Button type="submit" className="w-full" disabled={isSubmitting}>
              {isSubmitting ? "Submitting..." : "Submit application"}
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}

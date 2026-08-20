import { createFileRoute, Link, notFound } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { MapPin, DollarSign, Clock, Calendar, Briefcase, ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { getJobById } from "@/lib/jobs.functions";

const jobQueryOptions = (id: string) =>
  queryOptions({
    queryKey: ["job", id],
    queryFn: () => getJobById({ data: { id } }),
  });

export const Route = createFileRoute("/jobs/$id")({
  head: () => ({
    meta: [
      { title: "Job Details | NorthStarAgency" },
      { name: "description", content: "View job details and apply for overseas opportunities." },
      { property: "og:title", content: "Job Details | NorthStarAgency" },
      { property: "og:description", content: "View job details and apply for overseas opportunities." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: async ({ context, params }) => {
    const job = await context.queryClient.ensureQueryData(jobQueryOptions(params.id));
    if (!job) throw notFound();
    return job;
  },
  component: JobDetailPage,
});

function JobDetailPage() {
  const { data: job } = useSuspenseQuery(jobQueryOptions(Route.useParams().id));

  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <Button variant="ghost" size="sm" className="mb-6" asChild>
        <Link to="/jobs">
          <ArrowLeft className="mr-2 h-4 w-4" />
          Back to jobs
        </Link>
      </Button>

      <div className="grid gap-8 lg:grid-cols-3">
        <div className="lg:col-span-2">
          <div className="flex flex-wrap items-start justify-between gap-4">
            <div>
              <h1 className="text-3xl font-bold text-foreground md:text-4xl">{job.title}</h1>
              <p className="mt-2 text-lg text-muted-foreground">{job.category}</p>
            </div>
            {job.featured && (
              <Badge className="bg-accent text-accent-foreground hover:bg-accent">Featured</Badge>
            )}
          </div>

          <div className="mt-6 flex flex-wrap gap-4 text-sm text-muted-foreground">
            <span className="flex items-center gap-1">
              <MapPin className="h-4 w-4 text-primary" />
              {job.country}
              {job.location ? `, ${job.location}` : ""}
            </span>
            {job.salary && (
              <span className="flex items-center gap-1">
                <DollarSign className="h-4 w-4 text-primary" />
                {job.salary}
              </span>
            )}
            {job.job_type && (
              <span className="flex items-center gap-1">
                <Clock className="h-4 w-4 text-primary" />
                {job.job_type}
              </span>
            )}
            {job.posted_at && (
              <span className="flex items-center gap-1">
                <Calendar className="h-4 w-4 text-primary" />
                Posted {new Date(job.posted_at).toLocaleDateString()}
              </span>
            )}
          </div>

          <Card className="mt-8">
            <CardContent className="space-y-6 pt-6">
              <div>
                <h2 className="text-xl font-semibold text-foreground">Description</h2>
                <p className="mt-2 whitespace-pre-line text-muted-foreground">{job.description}</p>
              </div>
              <div>
                <h2 className="text-xl font-semibold text-foreground">Requirements</h2>
                <p className="mt-2 whitespace-pre-line text-muted-foreground">
                  {job.requirements}
                </p>
              </div>
            </CardContent>
          </Card>
        </div>

        <div>
          <Card className="sticky top-24">
            <CardContent className="pt-6">
              <h2 className="text-lg font-semibold text-foreground">Ready to apply?</h2>
              <p className="mt-2 text-sm text-muted-foreground">
                Create an account or sign in to submit your application for this role.
              </p>
              <Button className="mt-6 w-full" asChild>
                <Link to="/jobs/$id/apply" params={{ id: job.id }}>
                  <Briefcase className="mr-2 h-4 w-4" />
                  Apply now
                </Link>
              </Button>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}

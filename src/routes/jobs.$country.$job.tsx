import { createFileRoute, Link, notFound } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import {
  MapPin,
  DollarSign,
  Clock,
  Calendar,
  Briefcase,
  Phone,
  MessageCircle,
  Users,
  Building2,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { getJobBySlug } from "@/lib/jobs.functions";
import { getCountryBySlug, getCountryForJobCountryValue, site } from "@/lib/site";
import { formatShortDate } from "@/lib/job-links";

const jobQueryOptions = (slug: string) =>
  queryOptions({
    queryKey: ["job-by-slug", slug],
    queryFn: () => getJobBySlug({ data: { job_slug: slug } }),
  });

export const Route = createFileRoute("/jobs/$country/$job")({
  head: ({ loaderData }) => {
    const title = loaderData?.title
      ? `${loaderData.title} | ${site.shortName}`
      : `Job details | ${site.shortName}`;
    const description = loaderData?.title
      ? `${loaderData.title} in ${loaderData.country}. View the listing details and apply.`
      : "View job details and apply for overseas opportunities.";
    return {
      meta: [
        { title },
        { name: "description", content: description },
        { property: "og:title", content: title },
        { property: "og:description", content: description },
        { property: "og:type", content: "website" },
        { name: "twitter:card", content: "summary_large_image" },
      ],
    };
  },
  loader: async ({ context, params }) => {
    const country = getCountryBySlug(params.country);
    if (!country) throw notFound();
    const job = await context.queryClient.ensureQueryData(jobQueryOptions(params.job));
    if (!job) throw notFound();
    if (getCountryForJobCountryValue(job.country)?.slug !== country.slug) throw notFound();
    return job;
  },
  component: JobDetailPage,
});

function JobDetailPage() {
  const params = Route.useParams();
  const country = getCountryBySlug(params.country)!;
  const { data } = useSuspenseQuery(jobQueryOptions(params.job));
  const job = data!;
  const lastUpdated = formatShortDate(job.updated_at);

  const sections = (
    [
      ["Required experience", job.required_experience],
      ["Qualifications", job.qualifications],
      ["Responsibilities", job.responsibilities],
      ["Description", job.description],
      ["Requirements", job.requirements],
      ["Accommodation", job.accommodation],
      ["Transport", job.transport],
      ["Medical coverage", job.medical_coverage],
      ["Contract duration", job.contract_duration],
      ["Visa / work permit information", job.visa_info],
    ] as const
  ).filter(([, value]) => value && value.trim());

  return (
    <div className="container mx-auto px-4 py-14 md:py-20">
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
            <BreadcrumbPage>{job.title}</BreadcrumbPage>
          </BreadcrumbItem>
        </BreadcrumbList>
      </Breadcrumb>

      <div className="mt-8 grid gap-8 lg:grid-cols-3">
        <div className="lg:col-span-2">
          <div className="flex flex-wrap items-start justify-between gap-4">
            <div>
              <h1 className="font-display text-3xl font-bold text-foreground md:text-4xl">
                {job.title}
              </h1>
              {job.category && <p className="mt-2 text-lg text-muted-foreground">{job.category}</p>}
            </div>
            {job.featured && (
              <Badge className="bg-accent text-accent-foreground hover:bg-accent">Featured</Badge>
            )}
          </div>

          <div className="mt-6 flex flex-wrap gap-4 text-sm text-muted-foreground">
            <span className="flex items-center gap-1">
              <MapPin className="h-4 w-4 text-primary" />
              {job.country}
            </span>
            {job.location && (
              <span className="flex items-center gap-1">
                <Building2 className="h-4 w-4 text-primary" />
                {job.location}
              </span>
            )}
            {job.salary && (
              <span className="flex items-center gap-1">
                <DollarSign className="h-4 w-4 text-primary" />
                {job.salary}
              </span>
            )}
            {job.job_type && (
              <span className="flex items-center gap-1 capitalize">
                <Clock className="h-4 w-4 text-primary" />
                {job.job_type}
              </span>
            )}
            {job.vacancies ? (
              <span className="flex items-center gap-1">
                <Users className="h-4 w-4 text-primary" />
                {job.vacancies} {job.vacancies === 1 ? "vacancy" : "vacancies"}
              </span>
            ) : null}
            {lastUpdated && (
              <span className="flex items-center gap-1">
                <Calendar className="h-4 w-4 text-primary" />
                Last updated {lastUpdated}
              </span>
            )}
          </div>

          <Card className="mt-8">
            <CardContent className="space-y-6 pt-6">
              {sections.map(([label, value]) => (
                <div key={label}>
                  <h2 className="text-xl font-semibold text-foreground">{label}</h2>
                  <p className="mt-2 whitespace-pre-line text-muted-foreground">{value}</p>
                </div>
              ))}
            </CardContent>
          </Card>
        </div>

        <div className="space-y-4">
          <Card className="sticky top-24">
            <CardContent className="pt-6">
              <h2 className="text-lg font-semibold text-foreground">Ready to apply?</h2>
              <p className="mt-2 text-sm text-muted-foreground">
                Create an account or sign in to submit your application for this role.
              </p>
              <Button className="mt-6 w-full" asChild>
                <Link
                  to="/jobs/$country/$job/apply"
                  params={{ country: country.slug, job: params.job }}
                >
                  <Briefcase className="mr-2 h-4 w-4" />
                  Apply now
                </Link>
              </Button>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="pt-6">
              <h2 className="text-lg font-semibold text-foreground">Questions?</h2>
              <p className="mt-2 text-sm text-muted-foreground">
                Reach out directly for a quick response.
              </p>
              <div className="mt-4 flex flex-col gap-2">
                <Button variant="outline" className="w-full justify-start" asChild>
                  <a
                    href={`https://wa.me/${site.whatsapp.replace(/^\+/, "")}`}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    <MessageCircle className="mr-2 h-4 w-4" />
                    WhatsApp us
                  </a>
                </Button>
                <Button variant="outline" className="w-full justify-start" asChild>
                  <a href={`tel:${site.phone}`}>
                    <Phone className="mr-2 h-4 w-4" />
                    Call us
                  </a>
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}

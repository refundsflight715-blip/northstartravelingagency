import { createFileRoute, Link, notFound } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useState } from "react";
import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { JobCard } from "@/components/job-card";
import { FaqSection } from "@/components/faq-section";
import { Notice } from "@/components/notice";
import { getJobsByCountrySlug } from "@/lib/jobs.functions";
import { getCountryBySlug, site, generalNotice } from "@/lib/site";

const countryJobsQueryOptions = (slug: string) =>
  queryOptions({
    queryKey: ["country-jobs", slug],
    queryFn: () => getJobsByCountrySlug({ data: { country_slug: slug } }),
  });

export const Route = createFileRoute("/jobs/$country")({
  head: ({ params }) => {
    const country = getCountryBySlug(params.country);
    const name = country?.name ?? "Jobs";
    const title = `Jobs in ${name} | ${site.shortName}`;
    const description = `Current openings in ${name}, updated as verified vacancies become available.`;
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
    await context.queryClient.ensureQueryData(countryJobsQueryOptions(country.slug));
  },
  component: CountryJobsPage,
});

function CountryJobsPage() {
  const { country: countrySlug } = Route.useParams();
  const country = getCountryBySlug(countrySlug)!;
  const { data } = useSuspenseQuery(countryJobsQueryOptions(countrySlug));
  const jobs = data ?? [];

  const [search, setSearch] = useState("");
  const [category, setCategory] = useState("");
  const [jobType, setJobType] = useState("");
  const [city, setCity] = useState("");

  const categoryOptions = Array.from(new Set(jobs.map((j) => j.category).filter(Boolean))).sort();
  const typeOptions = Array.from(new Set(jobs.map((j) => j.job_type ?? "").filter(Boolean))).sort();
  const cityOptions = Array.from(new Set(jobs.map((j) => j.location ?? "").filter(Boolean))).sort();

  const resetAll = () => {
    setSearch("");
    setCategory("");
    setJobType("");
    setCity("");
  };

  const hasFilters = Boolean(search || category || jobType || city);

  const filtered = jobs.filter((job) => {
    const term = search.toLowerCase();
    const matchesSearch =
      !search ||
      [job.title, job.description, job.qualifications, job.responsibilities, job.location]
        .filter(Boolean)
        .some((v) => (v as string).toLowerCase().includes(term));
    return (
      matchesSearch &&
      (!category || job.category === category) &&
      (!jobType || job.job_type === jobType) &&
      (!city || job.location === city)
    );
  });

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
            <BreadcrumbPage>{country.name}</BreadcrumbPage>
          </BreadcrumbItem>
        </BreadcrumbList>
      </Breadcrumb>

      <div className="mt-8 border-l-2 border-primary/60 pl-5">
        <h1 className="font-display text-4xl font-bold text-foreground md:text-5xl">
          Jobs in {country.name}
        </h1>
        <p className="mt-3 max-w-2xl text-lg text-muted-foreground">
          Current openings in {country.name}, updated as verified vacancies become available.
        </p>
      </div>

      <div className="mt-8 flex flex-col gap-4 rounded-xl border border-border bg-card p-4 shadow-sm lg:flex-row lg:items-end">
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="country-job-search">
            Search
          </label>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              id="country-job-search"
              placeholder="Job title, keyword, city..."
              className="pl-9"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="country-job-category">
            Job category
          </label>
          <select
            id="country-job-category"
            className="h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          >
            <option value="">All categories</option>
            {categoryOptions.map((c) => (
              <option key={c} value={c}>
                {c}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="country-job-type">
            Employment type
          </label>
          <select
            id="country-job-type"
            className="h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm capitalize"
            value={jobType}
            onChange={(e) => setJobType(e.target.value)}
          >
            <option value="">All types</option>
            {typeOptions.map((t) => (
              <option key={t} value={t}>
                {t}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="country-job-city">
            City / location
          </label>
          <select
            id="country-job-city"
            className="h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
            value={city}
            onChange={(e) => setCity(e.target.value)}
          >
            <option value="">All locations</option>
            {cityOptions.map((c) => (
              <option key={c} value={c}>
                {c}
              </option>
            ))}
          </select>
        </div>
        <Button variant="outline" onClick={resetAll}>
          Reset
        </Button>
      </div>

      <div className="mt-6">
        {filtered.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border py-16 text-center">
            <p className="text-muted-foreground">
              {hasFilters
                ? "No jobs match your filters right now."
                : `Currently no vacancies listed for ${country.name}.`}
            </p>
            {hasFilters ? (
              <Button variant="link" onClick={resetAll}>
                Clear filters
              </Button>
            ) : (
              <Button variant="link" asChild>
                <Link to="/jobs">Browse all jobs</Link>
              </Button>
            )}
          </div>
        ) : (
          <>
            <p className="mb-4 text-sm text-muted-foreground">
              Showing {filtered.length} of {jobs.length} listings
            </p>
            <div className="grid gap-6 sm:grid-cols-2 xl:grid-cols-3">
              {filtered.map((job) => (
                <JobCard key={job.id} job={job} />
              ))}
            </div>
          </>
        )}
      </div>

      <Notice className="mt-10">{generalNotice}</Notice>

      <FaqSection
        className="mt-16"
        intro="Common questions about applying for the opportunities listed above."
      />
    </div>
  );
}

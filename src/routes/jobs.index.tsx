import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useState } from "react";
import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { JobCard } from "@/components/job-card";
import { FaqSection } from "@/components/faq-section";
import { Notice } from "@/components/notice";
import { getPublishedJobs } from "@/lib/jobs.functions";
import { site, jobCountries, jobCategories, employmentTypes, generalNotice } from "@/lib/site";

const allJobsQueryOptions = queryOptions({
  queryKey: ["published-jobs"],
  queryFn: () => getPublishedJobs({ data: {} }),
});

export const Route = createFileRoute("/jobs/")({
  head: () => ({
    meta: [
      { title: `Browse Overseas Jobs | ${site.shortName}` },
      {
        name: "description",
        content:
          "Browse current overseas job openings by country, category and employment type — caregivers, drivers, cleaners, hotel staff, construction and farm work.",
      },
      { property: "og:title", content: `Browse Overseas Jobs | ${site.shortName}` },
      {
        property: "og:description",
        content: "Current overseas job openings across multiple industries and countries.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(allJobsQueryOptions),
  component: JobsPage,
});

function JobsPage() {
  const { data: jobs } = useSuspenseQuery(allJobsQueryOptions);
  const [search, setSearch] = useState("");
  const [category, setCategory] = useState("");
  const [country, setCountry] = useState("");
  const [jobType, setJobType] = useState("");

  const countryOptions = Array.from(
    new Set([...jobCountries, ...jobs.map((j) => j.country)])
  ).sort((a, b) => a.localeCompare(b));
  const categoryOptions = Array.from(
    new Set([...jobCategories, ...jobs.map((j) => j.category)])
  ).sort((a, b) => a.localeCompare(b));
  const typeOptions = Array.from(
    new Set([...employmentTypes, ...jobs.map((j) => j.job_type ?? "").filter(Boolean)])
  );

  const countsByCountry = jobs.reduce<Record<string, number>>((acc, j) => {
    acc[j.country] = (acc[j.country] ?? 0) + 1;
    return acc;
  }, {});

  const resetAll = () => {
    setSearch("");
    setCategory("");
    setCountry("");
    setJobType("");
  };

  const filtered = jobs.filter((job) => {
    const term = search.toLowerCase();
    const matchesSearch =
      !search ||
      job.title.toLowerCase().includes(term) ||
      job.description.toLowerCase().includes(term) ||
      (job.location ?? "").toLowerCase().includes(term) ||
      job.country.toLowerCase().includes(term);
    const matchesCategory = !category || job.category === category;
    const matchesCountry = !country || job.country === country;
    const matchesType = !jobType || job.job_type === jobType;
    return matchesSearch && matchesCategory && matchesCountry && matchesType;
  });

  return (
    <div className="container mx-auto px-4 py-14 md:py-20">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="font-display text-4xl font-bold text-foreground md:text-5xl">
          Jobs opportunities
        </h1>
        <p className="mt-4 text-lg text-muted-foreground">
          Browse current openings by country, job category or employment type.
        </p>
      </div>

      {/* Country categories */}
      <div className="mt-10">
        <h2 className="text-sm font-semibold uppercase tracking-wider text-muted-foreground">
          Browse by country
        </h2>
        <div className="mt-3 flex flex-wrap gap-2">
          <Button
            variant={country === "" ? "default" : "outline"}
            size="sm"
            onClick={() => setCountry("")}
          >
            Browse all jobs
          </Button>
          {countryOptions.map((c) => (
            <Button
              key={c}
              variant={country === c ? "default" : "outline"}
              size="sm"
              onClick={() => setCountry(country === c ? "" : c)}
            >
              {c}
              {countsByCountry[c] ? (
                <span className="ml-1 text-xs opacity-70">({countsByCountry[c]})</span>
              ) : null}
            </Button>
          ))}
        </div>
      </div>

      {/* Search and filters */}
      <div className="mt-8 flex flex-col gap-4 rounded-xl border border-border bg-card p-4 shadow-sm lg:flex-row lg:items-end">
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="job-search">
            Search
          </label>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              id="job-search"
              placeholder="Job title, keyword, city..."
              className="pl-9"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="job-country">
            Country
          </label>
          <select
            id="job-country"
            className="h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
            value={country}
            onChange={(e) => setCountry(e.target.value)}
          >
            <option value="">All countries</option>
            {countryOptions.map((c) => (
              <option key={c} value={c}>
                {c}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground" htmlFor="job-category">
            Job category
          </label>
          <select
            id="job-category"
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
          <label className="text-sm font-medium text-foreground" htmlFor="job-type">
            Employment type
          </label>
          <select
            id="job-type"
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
        <Button variant="outline" onClick={resetAll}>
          Reset
        </Button>
      </div>

      <p className="mt-4 text-sm text-muted-foreground">
        Showing {filtered.length} of {jobs.length} listings
      </p>

      <div className="mt-6">
        {filtered.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border py-16 text-center">
            <p className="text-muted-foreground">No jobs match your filters right now.</p>
            <Button variant="link" onClick={resetAll}>
              Browse all jobs
            </Button>
          </div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 xl:grid-cols-3">
            {filtered.map((job) => (
              <JobCard key={job.id} job={job} />
            ))}
          </div>
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

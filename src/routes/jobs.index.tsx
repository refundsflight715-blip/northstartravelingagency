import { createFileRoute, Link } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useState } from "react";
import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { JobCard } from "@/components/job-card";
import { getPublishedJobs } from "@/lib/jobs.functions";
import { site } from "@/lib/site";

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
          "Browse current overseas job openings for cleaners, drivers, caregivers, hotel staff, construction workers and farm workers.",
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

  const categories = Array.from(new Set(jobs.map((j) => j.category)));
  const countries = Array.from(new Set(jobs.map((j) => j.country)));

  const [category, setCategory] = useState("");
  const [country, setCountry] = useState("");

  const filtered = jobs.filter((job) => {
    const matchesSearch =
      !search ||
      job.title.toLowerCase().includes(search.toLowerCase()) ||
      job.description.toLowerCase().includes(search.toLowerCase());
    const matchesCategory = !category || job.category === category;
    const matchesCountry = !country || job.country === country;
    return matchesSearch && matchesCategory && matchesCountry;
  });

  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">Browse overseas jobs</h1>
        <p className="mt-4 text-lg text-muted-foreground">
          Find your next opportunity abroad. Filter by category or country.
        </p>
      </div>

      <div className="mt-10 flex flex-col gap-4 rounded-xl border border-border bg-card p-4 shadow-sm md:flex-row md:items-end">
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground">Search</label>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              placeholder="Job title, keyword..."
              className="pl-9"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground">Category</label>
          <select
            className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          >
            <option value="">All categories</option>
            {categories.map((c) => (
              <option key={c} value={c}>
                {c}
              </option>
            ))}
          </select>
        </div>
        <div className="flex-1 space-y-2">
          <label className="text-sm font-medium text-foreground">Country</label>
          <select
            className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
            value={country}
            onChange={(e) => setCountry(e.target.value)}
          >
            <option value="">All countries</option>
            {countries.map((c) => (
              <option key={c} value={c}>
                {c}
              </option>
            ))}
          </select>
        </div>
        <Button
          variant="outline"
          onClick={() => {
            setSearch("");
            setCategory("");
            setCountry("");
          }}
        >
          Reset
        </Button>
      </div>

      <div className="mt-10">
        {filtered.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border py-16 text-center">
            <p className="text-muted-foreground">No jobs match your filters.</p>
            <Button variant="link" onClick={() => { setSearch(""); setCategory(""); setCountry(""); }}>
              Clear filters
            </Button>
          </div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {filtered.map((job) => (
              <JobCard key={job.id} job={job} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

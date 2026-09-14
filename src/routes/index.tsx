import { createFileRoute, Link } from "@tanstack/react-router";
import { queryOptions } from "@tanstack/react-query";
import { useSuspenseQuery } from "@tanstack/react-query";
import { ArrowRight, Globe, Briefcase, FileText, Plane } from "lucide-react";
import { Button } from "@/components/ui/button";
import { JobCard } from "@/components/job-card";
import { getPublishedJobs } from "@/lib/jobs.functions";
import { portfolios } from "@/lib/portfolios";
import editorialHero from "@/assets/northstar-editorial-hero.jpg";

const featuredJobsQueryOptions = queryOptions({
  queryKey: ["featured-jobs"],
  queryFn: () => getPublishedJobs({ data: {} }),
});

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "NorthStarAgency | Overseas Jobs & Travel Assistance" },
      {
        name: "description",
        content:
          "Find overseas job opportunities with NorthStarAgency. Recruitment, visa guidance, and travel assistance for cleaners, drivers, caregivers, hotel staff, construction and farm workers.",
      },
      {
        property: "og:title",
        content: "NorthStarAgency | Overseas Jobs & Travel Assistance",
      },
      {
        property: "og:description",
        content:
          "Find overseas job opportunities with NorthStarAgency. Recruitment, visa guidance, and travel assistance.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(featuredJobsQueryOptions),
  component: HomePage,
});

function HomePage() {
  const { data: jobs } = useSuspenseQuery(featuredJobsQueryOptions);

  return (
    <div className="flex flex-col">
      <section className="relative isolate flex min-h-[calc(100svh-74px)] overflow-hidden bg-sidebar text-sidebar-foreground xl:min-h-[calc(100svh-111px)]">
        <img
          src={editorialHero}
          alt="International professionals at an airport preparing for global career opportunities"
          width={1920}
          height={1080}
          className="hero-drift absolute inset-0 -z-20 h-full w-full object-cover object-[68%_center]"
          fetchPriority="high"
        />
        <div className="absolute inset-0 -z-10 bg-gradient-to-r from-sidebar via-sidebar/85 to-sidebar/20" />
        <div className="container mx-auto flex items-center px-5 py-14 sm:px-8 lg:px-12">
          <div className="editorial-reveal max-w-4xl">
            <div className="mb-6 flex items-center gap-4 sm:mb-8">
              <span className="text-[10px] font-semibold uppercase tracking-[0.32em] text-primary sm:text-xs">International careers · Professional guidance</span>
              <span className="hidden h-px w-20 bg-primary/70 sm:block" />
            </div>
            <h1 className="max-w-4xl font-display text-6xl leading-[0.88] text-sidebar-foreground sm:text-7xl md:text-8xl lg:text-9xl">
              Your Journey to a<br />
              <em className="font-normal text-primary">Global Career.</em>
            </h1>
            <div className="mt-8 flex max-w-3xl flex-col gap-8 sm:mt-10 lg:flex-row lg:items-end lg:gap-12">
              <p className="max-w-lg border-l border-primary/60 pl-5 text-base font-light leading-relaxed text-sidebar-foreground/80 sm:text-lg">
                Discover international job opportunities and receive professional guidance throughout your application and travel journey.
              </p>
              <div className="flex flex-col gap-3 sm:flex-row">
                <Button size="lg" className="h-14 rounded-none px-7 text-[11px] font-semibold uppercase tracking-[0.14em] transition-transform hover:-translate-y-0.5" asChild>
                  <Link to="/jobs">Explore available jobs <ArrowRight className="h-4 w-4" /></Link>
                </Button>
                <Button size="lg" variant="outline" className="h-14 rounded-none border-sidebar-foreground/30 bg-transparent px-7 text-[11px] font-semibold uppercase tracking-[0.14em] text-sidebar-foreground hover:border-primary hover:bg-primary/10 hover:text-primary" asChild>
                  <Link to="/auth">Apply now</Link>
                </Button>
              </div>
            </div>
          </div>
        </div>
        <div className="absolute bottom-5 right-5 hidden text-right sm:block lg:bottom-8 lg:right-10">
          <p className="text-[9px] uppercase tracking-[0.28em] text-sidebar-foreground/50">Based in Kenya</p>
          <p className="mt-1 font-display text-xl italic text-sidebar-foreground">Your journey, our priority.</p>
        </div>
      </section>


      {/* Services */}
      <section className="bg-background py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="mb-12 text-center">
            <p className="text-[10px] font-semibold uppercase tracking-[0.28em] text-primary">Guidance at every stage</p>
            <h2 className="mt-3 font-display text-4xl text-foreground md:text-5xl">What we do</h2>
            <p className="mt-3 text-muted-foreground">
              End-to-end support from job search to your first day abroad.
            </p>
          </div>
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {[
              {
                icon: Briefcase,
                title: "Job matching",
                text: "Browse vetted overseas roles across hospitality, construction, care, farming and more.",
              },
              {
                icon: FileText,
                title: "Document guidance",
                text: "Step-by-step help with resumes, certificates and application paperwork.",
              },
              {
                icon: Globe,
                title: "Visa support",
                text: "Clear guidance on visa requirements and interview preparation.",
              },
              {
                icon: Plane,
                title: "Travel assistance",
                text: "Help with flights, accommodation and arrival arrangements where applicable.",
              },
            ].map((service) => (
              <div
                key={service.title}
                className="border border-border bg-card p-6 text-card-foreground transition-colors hover:border-primary/60"
              >
                <service.icon className="h-10 w-10 text-primary" />
                <h3 className="mt-4 font-display text-2xl">{service.title}</h3>
                <p className="mt-2 text-sm text-muted-foreground">{service.text}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Career portfolios */}
      <section className="bg-muted/50 py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="mb-12 text-center">
            <h2 className="font-display text-4xl text-foreground md:text-5xl">Career portfolios</h2>
            <p className="mx-auto mt-3 max-w-2xl text-muted-foreground">
              Specialised tracks across aviation, security, courier and logistics — with partner
              employers on multiple continents.
            </p>
          </div>
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {portfolios.map((p) => (
              <Link
                key={p.slug}
                to="/portfolios"
                hash={p.slug}
                className="group overflow-hidden border border-border bg-card transition-shadow hover:shadow-md"
              >
                <img
                  src={p.image}
                  alt={`${p.title} professionals at work`}
                  loading="lazy"
                  width={1024}
                  height={768}
                  className="aspect-[4/3] w-full object-cover transition-transform duration-300 group-hover:scale-105"
                />
                <div className="p-5">
                  <h3 className="font-display text-2xl text-foreground group-hover:text-primary">
                    {p.title}
                  </h3>
                  <p className="mt-2 line-clamp-2 text-sm text-muted-foreground">{p.tagline}</p>
                  <p className="mt-3 text-xs font-medium uppercase tracking-wide text-primary">
                    {p.regions.join(" · ")}
                  </p>
                </div>
              </Link>
            ))}
          </div>
          <div className="mt-10 text-center">
            <Button variant="outline" asChild>
              <Link to="/portfolios">Explore all portfolios</Link>
            </Button>
          </div>
        </div>
      </section>

      {/* Featured jobs */}
      <section className="py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="mb-10 flex flex-col items-start justify-between gap-4 sm:flex-row sm:items-center">
            <div>
              <h2 className="font-display text-4xl text-foreground md:text-5xl">Featured jobs</h2>
              <p className="mt-1 text-muted-foreground">Latest overseas opportunities.</p>
            </div>
            <Button asChild>
              <Link to="/jobs">View all jobs</Link>
            </Button>
          </div>

          {jobs.length === 0 ? (
            <p className="text-muted-foreground">No published jobs yet. Check back soon.</p>
          ) : (
            <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
              {jobs.slice(0, 6).map((job) => (
                <JobCard key={job.id} job={job} />
              ))}
            </div>
          )}
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="bg-sidebar p-8 text-sidebar-foreground md:p-12">
            <div className="mx-auto max-w-2xl text-center">
              <h2 className="font-display text-4xl md:text-5xl">Ready to explore opportunities abroad?</h2>
              <p className="mt-4 text-lg/relaxed text-sidebar-foreground/75">
                Create a free account, complete your profile and apply for jobs in minutes.
              </p>
              <Button
                size="lg"
                variant="secondary"
                className="mt-8"
                asChild
              >
                <Link to="/auth">Create account</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}

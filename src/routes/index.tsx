import { createFileRoute, Link } from "@tanstack/react-router";
import { queryOptions } from "@tanstack/react-query";
import { useSuspenseQuery } from "@tanstack/react-query";
import { ArrowRight, Globe, Briefcase, FileText, Plane, Phone, MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { JobCard } from "@/components/job-card";
import { getPublishedJobs } from "@/lib/jobs.functions";
import { portfolios } from "@/lib/portfolios";
import { site } from "@/lib/site";
import heroAsset from "@/assets/northstar-hero-banner.jpg.asset.json";

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
      {/* Hero */}
      <section className="bg-primary">
        <img
          src={heroAsset.url}
          alt="NorthStarAgency — connecting you to global opportunities"
          width={1599}
          height={853}
          className="block h-auto w-full"
          fetchPriority="high"
        />
        <div className="container mx-auto px-4 py-8">
          <div className="flex flex-col flex-wrap justify-center gap-3 sm:flex-row">
            <Button size="lg" variant="secondary" asChild>
              <Link to="/jobs">
                Browse jobs
                <ArrowRight className="ml-2 h-5 w-5" />
              </Link>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="border-white/30 bg-white/10 text-white hover:bg-white/20 hover:text-white"
              asChild
            >
              <Link to="/contact">Get in touch</Link>
            </Button>
            <Button size="lg" variant="secondary" asChild>
              <a
                href={`https://wa.me/${site.whatsapp.replace(/^\+/, "")}`}
                target="_blank"
                rel="noopener noreferrer"
              >
                <MessageCircle className="mr-2 h-5 w-5" />
                WhatsApp us
              </a>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="border-white/30 bg-white/10 text-white hover:bg-white/20 hover:text-white"
              asChild
            >
              <a href={`tel:${site.phone}`}>
                <Phone className="mr-2 h-5 w-5" />
                Call us
              </a>
            </Button>
          </div>
        </div>
      </section>


      {/* Services */}
      <section className="py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="mb-12 text-center">
            <h2 className="text-3xl font-bold text-foreground">What we do</h2>
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
                className="rounded-xl border border-border bg-card p-6 text-card-foreground shadow-sm"
              >
                <service.icon className="h-10 w-10 text-primary" />
                <h3 className="mt-4 text-lg font-semibold">{service.title}</h3>
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
            <h2 className="text-3xl font-bold text-foreground">Career portfolios</h2>
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
                className="group overflow-hidden rounded-xl border border-border bg-card shadow-sm transition-shadow hover:shadow-md"
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
                  <h3 className="text-lg font-semibold text-foreground group-hover:text-primary">
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
              <h2 className="text-3xl font-bold text-foreground">Featured jobs</h2>
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
          <div className="rounded-2xl bg-accent p-8 text-accent-foreground md:p-12">
            <div className="mx-auto max-w-2xl text-center">
              <h2 className="text-3xl font-bold md:text-4xl">Ready to work abroad?</h2>
              <p className="mt-4 text-lg/relaxed text-accent-foreground/90">
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

import { createFileRoute, Link } from "@tanstack/react-router";
import { Check, Globe2, MapPin } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { portfolios } from "@/lib/portfolios";

export const Route = createFileRoute("/portfolios")({
  head: () => ({
    meta: [
      { title: "Career Portfolios | NorthStar Traveling Agency" },
      {
        name: "description",
        content:
          "Explore career portfolios for air hostesses, airport ground crew, aircraft technicians, security guards, couriers and logistics workers across continents.",
      },
      { property: "og:title", content: "Career Portfolios | NorthStar Traveling Agency" },
      {
        property: "og:description",
        content:
          "Specialised overseas career tracks in aviation, security, courier and logistics with international partner employers.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: PortfoliosPage,
});

function PortfoliosPage() {
  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">Career portfolios</h1>
        <p className="mt-4 text-lg text-muted-foreground">
          Specialised overseas career tracks. Each portfolio covers the roles we recruit for, the
          regions where placements are available, and what you need to qualify.
        </p>
      </div>

      <div className="mt-14 space-y-16">
        {portfolios.map((p, i) => (
          <section
            key={p.slug}
            id={p.slug}
            className="grid items-center gap-8 lg:grid-cols-2 lg:gap-12"
          >
            <div className={i % 2 === 1 ? "lg:order-2" : ""}>
              <img
                src={p.image}
                alt={`${p.title} professionals at work`}
                loading="lazy"
                width={1024}
                height={768}
                className="aspect-[4/3] w-full rounded-2xl object-cover shadow-md"
              />
            </div>
            <div className={i % 2 === 1 ? "lg:order-1" : ""}>
              <h2 className="text-2xl font-bold text-foreground md:text-3xl">{p.title}</h2>
              <p className="mt-3 text-muted-foreground">{p.tagline}</p>

              <div className="mt-5 flex flex-wrap gap-2">
                {p.regions.map((r) => (
                  <Badge key={r} variant="secondary" className="gap-1">
                    <MapPin className="h-3 w-3" />
                    {r}
                  </Badge>
                ))}
              </div>

              <div className="mt-6 grid gap-6 sm:grid-cols-2">
                <div>
                  <h3 className="text-sm font-semibold uppercase tracking-wide text-primary">
                    Roles
                  </h3>
                  <ul className="mt-2 space-y-1 text-sm text-muted-foreground">
                    {p.roles.map((r) => (
                      <li key={r} className="flex gap-2">
                        <Check className="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                        {r}
                      </li>
                    ))}
                  </ul>
                </div>
                <div>
                  <h3 className="text-sm font-semibold uppercase tracking-wide text-primary">
                    Eligibility
                  </h3>
                  <ul className="mt-2 space-y-1 text-sm text-muted-foreground">
                    {p.requirements.map((r) => (
                      <li key={r} className="flex gap-2">
                        <Check className="mt-0.5 h-4 w-4 shrink-0 text-accent" />
                        {r}
                      </li>
                    ))}
                  </ul>
                </div>
              </div>

              <p className="mt-6 flex gap-2 rounded-lg border border-border bg-muted/40 p-3 text-sm text-muted-foreground">
                <Globe2 className="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                {p.partners}
              </p>

              <div className="mt-6 flex flex-wrap gap-3">
                <Button asChild>
                  <Link to="/jobs">See open roles</Link>
                </Button>
                <Button variant="outline" asChild>
                  <Link to="/contact">Ask about this track</Link>
                </Button>
              </div>
            </div>
          </section>
        ))}
      </div>
    </div>
  );
}

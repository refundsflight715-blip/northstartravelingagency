import { createFileRoute, Link } from "@tanstack/react-router";
import { MapPin } from "lucide-react";
import { Notice } from "@/components/notice";
import { Button } from "@/components/ui/button";
import { destinations, eligibilityNotice, site } from "@/lib/site";
import australiaPoster from "@/assets/australia-security-works.jpg.asset.json";

export const Route = createFileRoute("/destinations")({
  head: () => ({
    meta: [
      { title: `Destinations | ${site.shortName}` },
      {
        name: "description",
        content:
          "Explore destinations where overseas opportunities are commonly advertised, including the Middle East, Europe, Canada and Australia.",
      },
      { property: "og:title", content: `Destinations | ${site.shortName}` },
      {
        property: "og:description",
        content: "Countries and regions where work opportunities are commonly advertised.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: DestinationsPage,
});

function DestinationsPage() {
  return (
    <div className="container mx-auto px-4 py-16 md:py-20">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">Destinations</h1>
        <p className="mt-5 text-lg text-muted-foreground">
          Regions and countries where opportunities are commonly advertised through our
          recruitment contacts.
        </p>
      </div>

      <div className="mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {destinations.map((d) => (
          <article
            key={d.slug}
            className="flex flex-col rounded-xl border border-border bg-card p-6 text-card-foreground"
          >
            <div className="flex items-center gap-2 text-sm text-muted-foreground">
              <MapPin className="h-4 w-4 text-primary" aria-hidden="true" />
              {d.region}
            </div>
            <h2 className="mt-2 text-xl font-semibold">{d.name}</h2>
            <p className="mt-2 flex-1 text-sm leading-relaxed text-muted-foreground">{d.blurb}</p>
            <ul className="mt-4 flex flex-wrap gap-2">
              {d.sectors.map((s) => (
                <li
                  key={s}
                  className="rounded-full bg-muted px-3 py-1 text-xs font-medium text-foreground/80"
                >
                  {s}
                </li>
              ))}
            </ul>
          </article>
        ))}
      </div>

      <Notice className="mx-auto mt-12 max-w-3xl">{eligibilityNotice}</Notice>

      <div className="mt-8 flex flex-wrap justify-center gap-3">
        <Button asChild>
          <Link to="/jobs">Browse opportunities</Link>
        </Button>
        <Button variant="outline" asChild>
          <Link to="/contact">Ask about a destination</Link>
        </Button>
      </div>
    </div>
  );
}

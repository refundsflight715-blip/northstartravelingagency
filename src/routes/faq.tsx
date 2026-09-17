import { createFileRoute, Link } from "@tanstack/react-router";
import { Notice } from "@/components/notice";
import { Button } from "@/components/ui/button";
import { FaqSection } from "@/components/faq-section";
import { generalNotice, eligibilityNotice, site } from "@/lib/site";

export const Route = createFileRoute("/faq")({
  head: () => ({
    meta: [
      { title: `Your Questions Answered | ${site.shortName}` },
      {
        name: "description",
        content:
          "Answers to common questions about applying for overseas opportunities, documents, timelines, destinations and staying safe from recruitment scams.",
      },
      { property: "og:title", content: `Your Questions Answered | ${site.shortName}` },
      {
        property: "og:description",
        content: "Common questions about the application process and requirements.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: FaqPage,
});

function FaqPage() {
  return (
    <div className="container mx-auto px-4 py-16 md:py-20">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="font-display text-4xl font-bold text-foreground md:text-5xl">
          Your Questions Answered
        </h1>
        <p className="mt-5 text-lg text-muted-foreground">{generalNotice}</p>
      </div>

      <FaqSection className="mt-10" title="" />

      <div className="mx-auto max-w-3xl">
        <Notice className="mt-10">{eligibilityNotice}</Notice>

        <div className="mt-8 flex flex-wrap justify-center gap-3">
          <Button asChild>
            <Link to="/contact">Ask a question</Link>
          </Button>
          <Button variant="outline" asChild>
            <Link to="/how-to-apply">How to apply</Link>
          </Button>
        </div>
      </div>
    </div>
  );
}

import { createFileRoute, Link } from "@tanstack/react-router";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Notice } from "@/components/notice";
import { Button } from "@/components/ui/button";
import { generalNotice, eligibilityNotice, site } from "@/lib/site";

const faqs = [
  {
    q: "Do you guarantee a job or a visa?",
    a: "No. Opportunities are subject to employer selection, applicant eligibility, and applicable immigration requirements. No outcome can be promised at any stage.",
  },
  {
    q: "How do I apply for a listed opportunity?",
    a: "Create an account, complete your profile, then submit an application from the listing page. You can follow the status of each application from your dashboard.",
  },
  {
    q: "Which documents will I need?",
    a: "Requirements vary by employer and destination. Commonly requested items include a valid passport, an updated CV, and any relevant certificates or references.",
  },
  {
    q: "How long does the process take?",
    a: "Timelines differ for every role and destination, and depend on the employer's recruitment schedule and on immigration processing, which we do not control.",
  },
  {
    q: "Which destinations do you cover?",
    a: "Opportunities are commonly advertised in the Middle East, Europe, Canada and Australia, and in other countries as they become available. See the destinations page.",
  },
  {
    q: "How will I be contacted about my application?",
    a: "Updates appear on your dashboard, and our team may contact you using the email address on your profile. Always verify that communication comes from our official email.",
  },
  {
    q: "How do I avoid recruitment scams?",
    a: "Never share sensitive documents or make payments to individuals claiming to represent us through unofficial channels. Contact us directly if you are unsure about a message.",
  },
];

export const Route = createFileRoute("/faq")({
  head: () => ({
    meta: [
      { title: `FAQ | ${site.shortName}` },
      {
        name: "description",
        content:
          "Answers to common questions about applying for overseas opportunities, documents, timelines, destinations and staying safe from recruitment scams.",
      },
      { property: "og:title", content: `FAQ | ${site.shortName}` },
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
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">
          Frequently Asked Questions
        </h1>
        <p className="mt-5 text-lg text-muted-foreground">{generalNotice}</p>
      </div>

      <div className="mx-auto mt-10 max-w-3xl">
        <Accordion type="single" collapsible className="w-full">
          {faqs.map((f, i) => (
            <AccordionItem key={f.q} value={`item-${i}`}>
              <AccordionTrigger className="text-left text-base font-medium">{f.q}</AccordionTrigger>
              <AccordionContent className="text-muted-foreground">{f.a}</AccordionContent>
            </AccordionItem>
          ))}
        </Accordion>

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

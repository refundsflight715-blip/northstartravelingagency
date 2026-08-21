import { createFileRoute, Link } from "@tanstack/react-router";
import { Notice } from "@/components/notice";
import { Button } from "@/components/ui/button";
import { applicationNotice, site } from "@/lib/site";

const steps = [
  {
    title: "1. Browse opportunities",
    text: "Review the listings on the jobs page and read the requirements, destination and role details carefully.",
  },
  {
    title: "2. Create an account",
    text: "Register with your email so you can submit applications and follow their progress from your dashboard.",
  },
  {
    title: "3. Complete your profile",
    text: "Add your personal details, work experience and contact information so employers can assess your suitability.",
  },
  {
    title: "4. Submit your application",
    text: "Apply to the roles that match your experience and include a short note about why you are suitable.",
  },
  {
    title: "5. Document guidance",
    text: "If you are shortlisted, our team explains which documents are typically requested and how to prepare them.",
  },
  {
    title: "6. Employer selection and travel process",
    text: "Employers make their own selection decisions. Where an offer is made, we assist with the travel and documentation process.",
  },
];

const documents = [
  "Valid passport (where required by the employer or destination)",
  "Updated CV / résumé",
  "Educational or professional certificates, if applicable",
  "Work references or experience letters, if available",
  "Any additional documents requested by the employer or immigration authorities",
];

export const Route = createFileRoute("/how-to-apply")({
  head: () => ({
    meta: [
      { title: `How to Apply | ${site.shortName}` },
      {
        name: "description",
        content:
          "Step-by-step guidance on applying for overseas opportunities: creating an account, completing your profile, submitting applications and preparing documents.",
      },
      { property: "og:title", content: `How to Apply | ${site.shortName}` },
      {
        property: "og:description",
        content: "A clear, step-by-step guide to the application process.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: HowToApplyPage,
});

function HowToApplyPage() {
  return (
    <div className="container mx-auto px-4 py-16 md:py-20">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">How to Apply</h1>
        <p className="mt-5 text-lg text-muted-foreground">
          A clear overview of each stage of the application process, from browsing listings to the
          employer&apos;s decision.
        </p>
      </div>

      <ol className="mt-12 grid gap-6 md:grid-cols-2">
        {steps.map((s) => (
          <li key={s.title} className="rounded-xl border border-border bg-card p-6">
            <h2 className="text-lg font-semibold text-card-foreground">{s.title}</h2>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{s.text}</p>
          </li>
        ))}
      </ol>

      <section className="mx-auto mt-14 max-w-3xl">
        <h2 className="text-2xl font-semibold text-foreground">Documents commonly requested</h2>
        <ul className="mt-4 list-disc space-y-2 pl-5 text-muted-foreground">
          {documents.map((d) => (
            <li key={d}>{d}</li>
          ))}
        </ul>
      </section>

      <Notice className="mx-auto mt-10 max-w-3xl">{applicationNotice}</Notice>

      <div className="mt-8 flex flex-wrap justify-center gap-3">
        <Button asChild>
          <Link to="/jobs">View opportunities</Link>
        </Button>
        <Button variant="outline" asChild>
          <Link to="/auth">Create an account</Link>
        </Button>
      </div>
    </div>
  );
}

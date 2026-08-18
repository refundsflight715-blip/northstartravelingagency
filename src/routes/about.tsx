import { createFileRoute } from "@tanstack/react-router";
import { Target, Shield, HeartHandshake, Users } from "lucide-react";

export const Route = createFileRoute("/about")({
  head: () => ({
    meta: [
      { title: "About Us | NorthStar Traveling Agency" },
      {
        name: "description",
        content:
          "Learn about NorthStar Traveling Agency's mission to connect job seekers with ethical overseas employers and provide trusted recruitment support.",
      },
      { property: "og:title", content: "About Us | NorthStar Traveling Agency" },
      {
        property: "og:description",
        content: "Learn about NorthStar Traveling Agency's mission and values.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: AboutPage,
});

function AboutPage() {
  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">About NorthStar</h1>
        <p className="mt-6 text-lg text-muted-foreground">
          NorthStar Traveling Agency is a recruitment and travel-assistance firm helping people find
          meaningful work abroad. We partner with verified employers in hospitality, healthcare
          support, construction, agriculture and logistics.
        </p>
      </div>

      <div className="mt-16 grid gap-8 md:grid-cols-2">
        {[
          {
            icon: Target,
            title: "Our mission",
            text: "To make overseas employment safe, transparent and accessible for everyone. We match candidates with reputable employers and guide them through every step.",
          },
          {
            icon: Shield,
            title: "Trust & compliance",
            text: "We review employer credentials, explain contracts clearly and never charge hidden placement fees to job seekers.",
          },
          {
            icon: HeartHandshake,
            title: "Candidate care",
            text: "From your first inquiry to your first day abroad, our team answers questions, prepares documents and coordinates travel logistics.",
          },
          {
            icon: Users,
            title: "Employer partnerships",
            text: "Companies rely on us to find reliable, motivated workers. We handle screening so employers can focus on onboarding.",
          },
        ].map((item) => (
          <div
            key={item.title}
            className="rounded-xl border border-border bg-card p-6 text-card-foreground"
          >
            <item.icon className="h-10 w-10 text-primary" />
            <h2 className="mt-4 text-xl font-semibold">{item.title}</h2>
            <p className="mt-2 text-muted-foreground">{item.text}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

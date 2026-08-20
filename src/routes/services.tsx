import { createFileRoute } from "@tanstack/react-router";
import { Briefcase, FileCheck, Plane, Home, ClipboardList, Globe } from "lucide-react";

export const Route = createFileRoute("/services")({
  head: () => ({
    meta: [
      { title: "Our Services | NorthStarAgency" },
      {
        name: "description",
        content:
          "Explore NorthStar's services: overseas job recruitment, application guidance, visa support, document preparation and travel arrangements.",
      },
      { property: "og:title", content: "Our Services | NorthStarAgency" },
      {
        property: "og:description",
        content: "Overseas job recruitment, application guidance, visa support and travel arrangements.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: ServicesPage,
});

function ServicesPage() {
  const services = [
    {
      icon: Briefcase,
      title: "Overseas job placement",
      text: "Access verified job openings for cleaners, drivers, caregivers, hotel staff, construction workers, farm workers and more.",
    },
    {
      icon: ClipboardList,
      title: "Application management",
      text: "We help you prepare resumes, complete employer forms and track application status in one place.",
    },
    {
      icon: FileCheck,
      title: "Document guidance",
      text: "Get clear checklists for certificates, police clearances, medical exams and other required paperwork.",
    },
      {
        icon: Globe,
        title: "Visa & interview prep",
        text: "Understand visa categories, embassy requirements and common interview questions for your destination country.",
      },
    {
      icon: Plane,
      title: "Travel coordination",
      text: "Assistance booking flights, arranging airport transfers and preparing for departure.",
    },
    {
      icon: Home,
      title: "Arrival support",
      text: "Where available, we help coordinate temporary accommodation and employer pickup details.",
    },
  ];

  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">Our services</h1>
        <p className="mt-6 text-lg text-muted-foreground">
          Everything you need to find, apply for and start an overseas job with confidence.
        </p>
      </div>

      <div className="mt-16 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {services.map((service) => (
          <div
            key={service.title}
            className="rounded-xl border border-border bg-card p-6 text-card-foreground shadow-sm"
          >
            <service.icon className="h-10 w-10 text-primary" />
            <h2 className="mt-4 text-xl font-semibold">{service.title}</h2>
            <p className="mt-2 text-muted-foreground">{service.text}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

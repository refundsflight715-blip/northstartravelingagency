import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { Mail, Phone, MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { contactSchema, type ContactInput } from "@/lib/schemas";
import { site } from "@/lib/site";
import { toast } from "sonner";

export const Route = createFileRoute("/contact")({
  head: () => ({
    meta: [
      { title: "Contact Us | NorthStarAgency" },
      {
        name: "description",
        content:
          "Contact NorthStarAgency for overseas job opportunities, recruitment partnerships, visa guidance and travel assistance.",
      },
      { property: "og:title", content: "Contact Us | NorthStarAgency" },
      {
        property: "og:description",
        content: "Reach out for overseas jobs, recruitment partnerships or travel assistance.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: ContactPage,
});

function ContactPage() {
  const [submitted, setSubmitted] = useState(false);
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<ContactInput>({ resolver: zodResolver(contactSchema) });

  const onSubmit = async (_values: ContactInput) => {
    await new Promise((resolve) => setTimeout(resolve, 800));
    setSubmitted(true);
    toast.success("Message sent. We will get back to you soon.");
  };

  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="text-4xl font-bold text-foreground md:text-5xl">Contact us</h1>
        <p className="mt-6 text-lg text-muted-foreground">
          Have a question about a job, visa process or partnership? Send us a message and our team
          will respond within one business day.
        </p>
      </div>

      <div className="mt-16 grid gap-12 lg:grid-cols-2">
        <div>
          <h2 className="text-xl font-semibold text-foreground">Get in touch</h2>
          <ul className="mt-6 space-y-4 text-muted-foreground">
            <li className="flex items-center gap-3">
              <Mail className="h-5 w-5 text-primary" />
              info@northstartravel.com
            </li>
            <li className="flex items-center gap-3">
              <Phone className="h-5 w-5 text-primary" />
              +1 (555) 123-4567
            </li>
            <li className="flex items-start gap-3">
              <MapPin className="mt-0.5 h-5 w-5 text-primary" />
              123 Global Plaza, Suite 400
            </li>
          </ul>
        </div>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div className="grid gap-4 sm:grid-cols-2">
            <div className="space-y-2">
              <Label htmlFor="name">Name</Label>
              <Input id="name" {...register("name")} />
              {errors.name && <p className="text-sm text-destructive">{errors.name.message}</p>}
            </div>
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input id="email" type="email" {...register("email")} />
              {errors.email && <p className="text-sm text-destructive">{errors.email.message}</p>}
            </div>
          </div>
          <div className="space-y-2">
            <Label htmlFor="phone">Phone (optional)</Label>
            <Input id="phone" {...register("phone")} />
          </div>
          <div className="space-y-2">
            <Label htmlFor="subject">Subject</Label>
            <Input id="subject" {...register("subject")} />
            {errors.subject && (
              <p className="text-sm text-destructive">{errors.subject.message}</p>
            )}
          </div>
          <div className="space-y-2">
            <Label htmlFor="message">Message</Label>
            <Textarea id="message" rows={5} {...register("message")} />
            {errors.message && (
              <p className="text-sm text-destructive">{errors.message.message}</p>
            )}
          </div>
          <Button type="submit" className="w-full" disabled={isSubmitting || submitted}>
            {isSubmitting ? "Sending..." : submitted ? "Message sent" : "Send message"}
          </Button>
        </form>
      </div>
    </div>
  );
}

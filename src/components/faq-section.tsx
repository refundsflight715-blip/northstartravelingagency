import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { faqs as defaultFaqs, type Faq } from "@/lib/faqs";

interface FaqSectionProps {
  items?: Faq[];
  title?: string;
  intro?: string;
  className?: string;
}

export function FaqSection({
  items = defaultFaqs,
  title = "Your Questions Answered",
  intro,
  className = "",
}: FaqSectionProps) {
  return (
    <section className={className}>
      <div className="mx-auto max-w-3xl text-center">
        <h2 className="font-display text-3xl font-bold text-foreground md:text-4xl">{title}</h2>
        {intro && <p className="mt-4 text-muted-foreground">{intro}</p>}
      </div>
      <div className="mx-auto mt-8 max-w-3xl">
        <Accordion type="single" collapsible className="w-full">
          {items.map((f, i) => (
            <AccordionItem key={f.q} value={`faq-${i}`}>
              <AccordionTrigger className="text-left text-base font-medium">
                {f.q}
              </AccordionTrigger>
              <AccordionContent className="text-muted-foreground">{f.a}</AccordionContent>
            </AccordionItem>
          ))}
        </Accordion>
      </div>
    </section>
  );
}

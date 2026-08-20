import { Info } from "lucide-react";
import { cn } from "@/lib/utils";

export function Notice({
  children,
  className,
  title = "Please note",
}: {
  children: React.ReactNode;
  className?: string;
  title?: string;
}) {
  return (
    <div
      className={cn(
        "flex gap-3 rounded-xl border border-border bg-muted/60 p-4 text-sm leading-relaxed text-muted-foreground sm:p-5",
        className
      )}
    >
      <Info className="mt-0.5 h-5 w-5 shrink-0 text-primary" aria-hidden="true" />
      <p>
        <span className="font-semibold text-foreground">{title}: </span>
        {children}
      </p>
    </div>
  );
}

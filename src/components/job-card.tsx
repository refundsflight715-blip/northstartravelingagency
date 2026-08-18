import { Link } from "@tanstack/react-router";
import { MapPin, Briefcase, DollarSign, Clock } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

interface Job {
  id: string;
  title: string;
  category: string;
  country: string;
  location?: string | null;
  salary?: string | null;
  job_type?: string | null;
  featured?: boolean | null;
}

export function JobCard({ job }: { job: Job }) {
  return (
    <Card className="group flex h-full flex-col transition-shadow hover:shadow-md">
      <CardHeader className="pb-3">
        <div className="flex items-start justify-between gap-2">
          <h3 className="text-lg font-semibold leading-tight text-foreground group-hover:text-primary">
            {job.title}
          </h3>
          {job.featured && (
            <Badge className="shrink-0 bg-accent text-accent-foreground hover:bg-accent">
              Featured
            </Badge>
          )}
        </div>
        <p className="text-sm text-muted-foreground">{job.category}</p>
      </CardHeader>
      <CardContent className="flex flex-1 flex-col gap-3">
        <div className="flex flex-wrap gap-3 text-sm text-muted-foreground">
          <span className="flex items-center gap-1">
            <MapPin className="h-4 w-4 text-primary" />
            {job.country}
            {job.location ? `, ${job.location}` : ""}
          </span>
          {job.salary && (
            <span className="flex items-center gap-1">
              <DollarSign className="h-4 w-4 text-primary" />
              {job.salary}
            </span>
          )}
          {job.job_type && (
            <span className="flex items-center gap-1">
              <Clock className="h-4 w-4 text-primary" />
              {job.job_type}
            </span>
          )}
        </div>
        <div className="mt-auto pt-4">
          <Button variant="outline" size="sm" className="w-full" asChild>
            <Link to="/jobs/$id" params={{ id: job.id }}>
              <Briefcase className="mr-2 h-4 w-4" />
              View details
            </Link>
          </Button>
        </div>
      </CardContent>
    </Card>
  );
}

import { Link } from "@tanstack/react-router";
import { MapPin, Briefcase, DollarSign, Clock, Users, Building2, CalendarClock } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { jobPathParams, formatShortDate } from "@/lib/job-links";

interface Job {
  id: string;
  slug?: string | null;
  title: string;
  category: string;
  country: string;
  location?: string | null;
  salary?: string | null;
  job_type?: string | null;
  featured?: boolean | null;
  description?: string | null;
  requirements?: string | null;
  vacancies?: number | null;
  updated_at?: string | null;
  required_experience?: string | null;
  qualifications?: string | null;
  responsibilities?: string | null;
  accommodation?: string | null;
  transport?: string | null;
  medical_coverage?: string | null;
  contract_duration?: string | null;
  visa_info?: string | null;
}

const filled = (value?: string | null) => (value && value.trim() ? value.trim() : null);

export function JobCard({ job }: { job: Job }) {
  const params = jobPathParams(job);
  const city = filled(job.location);
  const lastUpdated = formatShortDate(job.updated_at);

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
        <div className="flex flex-wrap gap-x-3 gap-y-2 text-sm text-muted-foreground">
          <span className="flex items-center gap-1">
            <MapPin className="h-4 w-4 text-primary" />
            {job.country}
          </span>
          {city && (
            <span className="flex items-center gap-1">
              <Building2 className="h-4 w-4 text-primary" />
              {city}
            </span>
          )}
          {job.salary && (
            <span className="flex items-center gap-1">
              <DollarSign className="h-4 w-4 text-primary" />
              {job.salary}
            </span>
          )}
          {job.job_type && (
            <span className="flex items-center gap-1 capitalize">
              <Clock className="h-4 w-4 text-primary" />
              {job.job_type}
            </span>
          )}
          {job.vacancies ? (
            <span className="flex items-center gap-1">
              <Users className="h-4 w-4 text-primary" />
              {job.vacancies} {job.vacancies === 1 ? "vacancy" : "vacancies"}
            </span>
          ) : null}
        </div>

        {(filled(job.contract_duration) || filled(job.accommodation)) && (
          <div className="flex flex-wrap gap-2">
            {filled(job.contract_duration) && (
              <Badge variant="secondary" className="font-normal">
                Contract: {filled(job.contract_duration)}
              </Badge>
            )}
            {filled(job.accommodation) && (
              <Badge variant="secondary" className="font-normal">
                Accommodation: {filled(job.accommodation)}
              </Badge>
            )}
          </div>
        )}

        {filled(job.description) && (
          <p className="line-clamp-3 text-sm text-muted-foreground">{job.description}</p>
        )}
        {job.requirements && (
          <p className="line-clamp-2 text-sm text-muted-foreground">
            <span className="font-medium text-foreground">Requirements: </span>
            {job.requirements}
          </p>
        )}

        {lastUpdated && (
          <p className="flex items-center gap-1 text-xs text-muted-foreground">
            <CalendarClock className="h-3.5 w-3.5" />
            Last updated {lastUpdated}
          </p>
        )}

        {params && (
          <div className="mt-auto grid gap-2 pt-4 sm:grid-cols-2">
            <Button variant="outline" size="sm" className="w-full" asChild>
              <Link to="/jobs/$country/$job" params={params}>
                <Briefcase className="mr-2 h-4 w-4" />
                View job
              </Link>
            </Button>
            <Button size="sm" className="w-full" asChild>
              <Link to="/jobs/$country/$job/apply" params={params}>
                Apply now
              </Link>
            </Button>
          </div>
        )}
      </CardContent>
    </Card>
  );
}

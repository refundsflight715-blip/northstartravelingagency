import { getCountryForJobCountryValue } from "./site";

export interface JobLinkSource {
  id: string;
  country: string;
  slug?: string | null;
}

/**
 * Resolves the /jobs/$country/$job route params for a job.
 * Returns null when the job's country is not in the country directory.
 */
export function jobPathParams(job: JobLinkSource): { country: string; job: string } | null {
  const country = getCountryForJobCountryValue(job.country);
  if (!country) return null;
  return { country: country.slug, job: job.slug ?? job.id };
}

export function formatShortDate(value?: string | null) {
  if (!value) return null;
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return null;
  return date.toLocaleDateString(undefined, {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
}

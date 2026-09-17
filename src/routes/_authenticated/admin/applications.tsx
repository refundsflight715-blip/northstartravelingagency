import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { getAllApplications, updateApplicationStatus } from "@/lib/applications.functions";
import { applicationStatusSchema, applicationStatusLabels } from "@/lib/schemas";
import { useServerFn } from "@tanstack/react-start";
import { useState } from "react";
import { toast } from "sonner";

const adminApplicationsQueryOptions = queryOptions({
  queryKey: ["admin-applications"],
  queryFn: () => getAllApplications(),
});

export const Route = createFileRoute("/_authenticated/admin/applications")({
  head: () => ({
    meta: [
      { title: "Manage Applications | NorthStar Admin" },
      { name: "description", content: "Review and update job applications." },
      { property: "og:title", content: "Manage Applications | NorthStar Admin" },
      { property: "og:description", content: "Review and update job applications." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(adminApplicationsQueryOptions),
  component: AdminApplicationsPage,
});

function AdminApplicationsPage() {
  const { data: applications, refetch } = useSuspenseQuery(adminApplicationsQueryOptions);
  const updateFn = useServerFn(updateApplicationStatus);
  const [notes, setNotes] = useState<Record<string, string>>({});

  const handleStatusChange = async (id: string, status: string) => {
    try {
      await updateFn({ data: { id, status: status as typeof applicationStatusSchema._type, admin_notes: notes[id] } });
      toast.success("Status updated.");
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to update status.");
    }
  };

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-bold text-foreground">Applications</h2>
      <div className="space-y-4">
        {applications.map((app) => {
          const job = app.jobs as unknown as { title: string; country: string; category: string } | null;
          const profile = app.profiles as unknown as { full_name: string; phone: string; country: string } | null;
          const name = app.applicant_name ?? profile?.full_name ?? "Applicant";
          const phone = app.applicant_phone ?? profile?.phone ?? "—";
          const email = app.applicant_email ?? "—";
          const fromCountry = app.applicant_country ?? profile?.country ?? "—";
          const statusKey = (app.status ?? "new") as keyof typeof applicationStatusLabels;
          return (
            <Card key={app.id}>
              <CardContent className="space-y-4 py-4">
                <div className="flex flex-col justify-between gap-2 sm:flex-row sm:items-start">
                  <div>
                    <h3 className="font-semibold text-foreground">{job?.title}</h3>
                    <p className="text-sm text-muted-foreground">
                      {job?.country} &middot; {job?.category}
                    </p>
                    <p className="mt-2 text-sm text-foreground">{name}</p>
                    <p className="text-sm text-muted-foreground">
                      {phone} &middot; {email} &middot; From: {fromCountry}
                    </p>
                    <p className="text-xs text-muted-foreground">
                      Submitted {new Date(app.created_at).toLocaleString()}
                    </p>
                  </div>
                  <Badge
                    className={
                      statusKey === "completed"
                        ? "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-100"
                        : statusKey === "interview"
                          ? "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-100"
                          : statusKey === "documents_required"
                            ? "bg-orange-100 text-orange-800 dark:bg-orange-900 dark:text-orange-100"
                            : "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-100"
                    }
                  >
                    {applicationStatusLabels[statusKey] ?? app.status}
                  </Badge>
                </div>
                <div>
                  <p className="text-sm font-medium text-foreground">Application details</p>
                  <p className="mt-1 whitespace-pre-line text-sm text-muted-foreground">{app.cover_letter}</p>
                </div>
                <div className="grid gap-4 sm:grid-cols-2">
                  <div>
                    <label className="text-sm font-medium text-foreground">Update status</label>
                    <Select value={app.status ?? "new"} onValueChange={(v) => handleStatusChange(app.id, v)}>
                      <SelectTrigger className="mt-1 w-full">
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        {applicationStatusSchema.options.map((s) => (
                          <SelectItem key={s} value={s}>
                            {s}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <label className="text-sm font-medium text-foreground">Admin notes</label>
                    <Textarea
                      className="mt-1"
                      rows={2}
                      value={notes[app.id] ?? app.admin_notes ?? ""}
                      onChange={(e) => setNotes((prev) => ({ ...prev, [app.id]: e.target.value }))}
                    />
                  </div>
                </div>
              </CardContent>
            </Card>
          );
        })}
        {applications.length === 0 && (
          <p className="text-muted-foreground">No applications yet.</p>
        )}
      </div>
    </div>
  );
}

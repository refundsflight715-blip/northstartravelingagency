import { createFileRoute, Link } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { getAdminStats } from "@/lib/admin.functions";
import { FileText, Clock, CheckCircle2, XCircle, ArrowRight, Briefcase, Users } from "lucide-react";

const statsQueryOptions = queryOptions({
  queryKey: ["admin-stats"],
  queryFn: () => getAdminStats(),
});

export const Route = createFileRoute("/_authenticated/admin/")({
  head: () => ({
    meta: [
      { title: "Admin Dashboard | NorthStarAgency" },
      { name: "description", content: "NorthStar admin dashboard overview." },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(statsQueryOptions),
  component: AdminDashboardPage,
});

function AdminDashboardPage() {
  const { data: stats } = useSuspenseQuery(statsQueryOptions);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold tracking-tight text-foreground">Admin Overview</h1>
        <p className="text-sm text-muted-foreground">
          Real-time metrics for client applications and system activity.
        </p>
      </div>

      {/* Primary Application Metric Cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Card className="border-l-4 border-l-blue-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Total Applications
            </CardTitle>
            <FileText className="h-4 w-4 text-blue-500" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-foreground">{stats.totalApplications}</div>
            <p className="text-xs text-muted-foreground mt-1">All submitted candidate profiles</p>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-amber-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Pending
            </CardTitle>
            <Clock className="h-4 w-4 text-amber-500" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-amber-600">{stats.pendingApplications}</div>
            <p className="text-xs text-muted-foreground mt-1">Awaiting initial agency review</p>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-emerald-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Approved
            </CardTitle>
            <CheckCircle2 className="h-4 w-4 text-emerald-500" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-emerald-600">{stats.approvedApplications}</div>
            <p className="text-xs text-muted-foreground mt-1">Accepted for visa / placement</p>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-rose-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Rejected
            </CardTitle>
            <XCircle className="h-4 w-4 text-rose-500" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-rose-600">{stats.rejectedApplications}</div>
            <p className="text-xs text-muted-foreground mt-1">Declined or unqualified</p>
          </CardContent>
        </Card>
      </div>

      {/* Secondary Site Counters */}
      <div className="grid gap-4 sm:grid-cols-2">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Active Vacancies</CardTitle>
            <Briefcase className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-semibold text-foreground">{stats.jobs}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Registered Users</CardTitle>
            <Users className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-semibold text-foreground">{stats.users}</div>
          </CardContent>
        </Card>
      </div>

      {/* Recent Applications Section */}
      <Card>
        <CardHeader className="flex flex-row items-center justify-between">
          <div>
            <CardTitle>Recent Client Applications</CardTitle>
            <p className="text-xs text-muted-foreground mt-0.5">Latest candidates who submitted their profiles</p>
          </div>
          <Button asChild size="sm" variant="outline">
            <Link to="/admin/applications">
              View All <ArrowRight className="ml-1.5 h-3.5 w-3.5" />
            </Link>
          </Button>
        </CardHeader>
        <CardContent>
          {stats.recentApplications.length === 0 ? (
            <p className="text-sm text-muted-foreground py-4 text-center">No client applications recorded yet.</p>
          ) : (
            <div className="divide-y rounded-md border">
              {stats.recentApplications.map((app) => (
                <div key={app.id} className="flex items-center justify-between p-3 text-sm">
                  <div>
                    <span className="font-medium text-foreground">{app.applicant_name}</span>
                    <span className="text-xs text-muted-foreground block">
                      {app.job_category || "General"} &bull; {app.country_of_interest || app.applicant_country}
                    </span>
                  </div>
                  <Badge variant="outline" className="capitalize">
                    {app.status}
                  </Badge>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}

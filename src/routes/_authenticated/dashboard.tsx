import { createFileRoute, Link } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { Briefcase, FileText, User, Shield } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { getMyApplications } from "@/lib/applications.functions";
import { getCurrentUser } from "@/lib/auth.functions";

const dashboardQueryOptions = queryOptions({
  queryKey: ["dashboard"],
  queryFn: () => Promise.all([getCurrentUser(), getMyApplications()]),
});

export const Route = createFileRoute("/_authenticated/dashboard")({
  head: () => ({
    meta: [
      { title: "Dashboard | NorthStar Traveling Agency" },
      { name: "description", content: "Your NorthStar candidate dashboard." },
      { property: "og:title", content: "Dashboard | NorthStar Traveling Agency" },
      { property: "og:description", content: "Your NorthStar candidate dashboard." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(dashboardQueryOptions),
  component: DashboardPage,
});

function DashboardPage() {
  const { data } = useSuspenseQuery(dashboardQueryOptions);
  const [user, applications] = data;

  return (
    <div className="container mx-auto px-4 py-16 md:py-24">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground md:text-4xl">
          Welcome, {user.profile?.full_name || user.email}
        </h1>
        <p className="mt-2 text-muted-foreground">Manage your profile, applications and account.</p>
      </div>

      <div className="grid gap-6 md:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Applications
            </CardTitle>
            <FileText className="h-5 w-5 text-primary" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-foreground">{applications.length}</div>
            <p className="text-xs text-muted-foreground">Total job applications</p>
          </CardContent>
        </Card>

        <Button variant="outline" className="h-auto flex-col items-start gap-2 p-6" asChild>
          <Link to="/profile">
            <User className="h-6 w-6 text-primary" />
            <span className="text-lg font-semibold">Edit profile</span>
            <span className="text-sm font-normal text-muted-foreground">
              Update your details and resume
            </span>
          </Link>
        </Button>

        <Button variant="outline" className="h-auto flex-col items-start gap-2 p-6" asChild>
          <Link to="/jobs">
            <Briefcase className="h-6 w-6 text-primary" />
            <span className="text-lg font-semibold">Browse jobs</span>
            <span className="text-sm font-normal text-muted-foreground">
              Find your next opportunity
            </span>
          </Link>
        </Button>
      </div>

      {user.roles.includes("admin") && (
        <div className="mt-8">
          <Button className="gap-2" asChild>
            <Link to="/admin">
              <Shield className="h-4 w-4" />
              Admin panel
            </Link>
          </Button>
        </div>
      )}

      <h2 className="mt-12 text-2xl font-bold text-foreground">My applications</h2>
      <div className="mt-6 space-y-4">
        {applications.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border py-12 text-center">
            <p className="text-muted-foreground">You haven't applied to any jobs yet.</p>
            <Button className="mt-4" asChild>
              <Link to="/jobs">Browse jobs</Link>
            </Button>
          </div>
        ) : (
          applications.map((app) => (
            <Card key={app.id}>
              <CardContent className="flex flex-col justify-between gap-4 py-4 sm:flex-row sm:items-center">
                <div>
                  <h3 className="font-semibold text-foreground">
                    {(app.jobs as { title: string })?.title}
                  </h3>
                  <p className="text-sm text-muted-foreground">
                    Applied {new Date(app.created_at ?? "").toLocaleDateString()}
                  </p>
                </div>
                <span
                  className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium capitalize ${
                    app.status === "hired"
                      ? "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-100"
                      : app.status === "rejected"
                        ? "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-100"
                        : app.status === "shortlisted"
                          ? "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-100"
                          : "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-100"
                  }`}
                >
                  {app.status}
                </span>
              </CardContent>
            </Card>
          ))
        )}
      </div>
    </div>
  );
}

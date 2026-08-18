import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { getAdminStats } from "@/lib/admin.functions";

const statsQueryOptions = queryOptions({
  queryKey: ["admin-stats"],
  queryFn: () => getAdminStats(),
});

export const Route = createFileRoute("/_authenticated/admin/")({
  head: () => ({
    meta: [
      { title: "Admin Dashboard | NorthStar Traveling Agency" },
      { name: "description", content: "NorthStar admin dashboard overview." },
      { property: "og:title", content: "Admin Dashboard | NorthStar Traveling Agency" },
      { property: "og:description", content: "NorthStar admin dashboard overview." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(statsQueryOptions),
  component: AdminDashboardPage,
});

function AdminDashboardPage() {
  const { data: stats } = useSuspenseQuery(statsQueryOptions);

  const statusCounts = stats.recentStatuses.reduce(
    (acc, curr) => {
      const key = curr.status ?? "pending";
      acc[key] = (acc[key] ?? 0) + 1;
      return acc;
    },
    {} as Record<string, number>
  );

  return (
    <div className="space-y-6">
      <div className="grid gap-4 md:grid-cols-3">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Total jobs</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-foreground">{stats.jobs}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">
              Applications
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-foreground">{stats.applications}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Users</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-bold text-foreground">{stats.users}</div>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Recent application statuses</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex flex-wrap gap-2">
            {Object.entries(statusCounts).map(([status, count]) => (
              <span
                key={status}
                className="inline-flex items-center rounded-full bg-muted px-3 py-1 text-sm font-medium capitalize"
              >
                {status}: {count}
              </span>
            ))}
            {stats.recentStatuses.length === 0 && (
              <p className="text-sm text-muted-foreground">No recent applications.</p>
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}

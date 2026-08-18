import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { getUserRoles, setUserRole, removeUserRole } from "@/lib/admin.functions";
import { appRoleSchema } from "@/lib/schemas";
import { useServerFn } from "@tanstack/react-start";
import { useState } from "react";
import { toast } from "sonner";

const adminUsersQueryOptions = queryOptions({
  queryKey: ["admin-users"],
  queryFn: () => getUserRoles(),
});

export const Route = createFileRoute("/_authenticated/admin/users")({
  head: () => ({
    meta: [
      { title: "Manage Users | NorthStar Admin" },
      { name: "description", content: "Manage user roles." },
      { property: "og:title", content: "Manage Users | NorthStar Admin" },
      { property: "og:description", content: "Manage user roles." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(adminUsersQueryOptions),
  component: AdminUsersPage,
});

function AdminUsersPage() {
  const { data: roles, refetch } = useSuspenseQuery(adminUsersQueryOptions);
  const setRoleFn = useServerFn(setUserRole);
  const removeRoleFn = useServerFn(removeUserRole);
  const [selectedRole, setSelectedRole] = useState<Record<string, string>>({});

  const users = Array.from(
    new Map(roles.map((r) => [r.user_id, r.profiles as unknown as { full_name: string; email: string } | null])).entries()
  );

  const handleAddRole = async (userId: string) => {
    const role = selectedRole[userId];
    if (!role) return;
    try {
      await setRoleFn({ data: { user_id: userId, role: role as typeof appRoleSchema._type } });
      toast.success("Role assigned.");
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to assign role.");
    }
  };

  const handleRemoveRole = async (userId: string, role: string) => {
    try {
      await removeRoleFn({ data: { user_id: userId, role: role as typeof appRoleSchema._type } });
      toast.success("Role removed.");
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to remove role.");
    }
  };

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-bold text-foreground">Users & roles</h2>
      <div className="space-y-4">
        {users.map(([userId, profile]) => {
          const userRoles = roles.filter((r) => r.user_id === userId).map((r) => r.role);
          return (
            <Card key={userId}>
              <CardContent className="flex flex-col justify-between gap-4 py-4 sm:flex-row sm:items-center">
                <div>
                  <h3 className="font-semibold text-foreground">{profile?.full_name || "Unnamed"}</h3>
                  <p className="text-sm text-muted-foreground">{profile?.email || userId}</p>
                  <div className="mt-2 flex flex-wrap gap-2">
                    {userRoles.map((role) => (
                      <Badge key={role} variant="secondary" className="capitalize">
                        {role}
                        <button
                          className="ml-2 text-destructive hover:text-destructive/80"
                          onClick={() => handleRemoveRole(userId, role)}
                        >
                          &times;
                        </button>
                      </Badge>
                    ))}
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  <Select
                    value={selectedRole[userId] ?? ""}
                    onValueChange={(v) => setSelectedRole((prev) => ({ ...prev, [userId]: v }))}
                  >
                    <SelectTrigger className="w-32">
                      <SelectValue placeholder="Role" />
                    </SelectTrigger>
                    <SelectContent>
                      {appRoleSchema.options.map((r) => (
                        <SelectItem key={r} value={r}>
                          {r}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                  <Button size="sm" onClick={() => handleAddRole(userId)}>
                    Add
                  </Button>
                </div>
              </CardContent>
            </Card>
          );
        })}
        {users.length === 0 && <p className="text-muted-foreground">No users found.</p>}
      </div>
    </div>
  );
}

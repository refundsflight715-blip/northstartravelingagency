import { createFileRoute, Link, Outlet, redirect } from "@tanstack/react-router";
import { useLocation } from "@tanstack/react-router";
import { LayoutDashboard, Briefcase, FileText, Users } from "lucide-react";
import { getCurrentUser } from "@/lib/auth.functions";

export const Route = createFileRoute("/_authenticated/admin")({
  beforeLoad: async () => {
    const user = await getCurrentUser();
    if (!user.roles.includes("admin")) throw redirect({ to: "/dashboard" });
  },
  component: AdminLayout,
});

function AdminLayout() {
  const { pathname } = useLocation();
  const items = [
    { to: "/admin", label: "Dashboard", icon: LayoutDashboard },
    { to: "/admin/jobs", label: "Jobs", icon: Briefcase },
    { to: "/admin/applications", label: "Applications", icon: FileText },
    { to: "/admin/users", label: "Users", icon: Users },
  ];

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-foreground">Admin panel</h1>
      <nav className="mt-6 flex flex-wrap gap-2 border-b border-border pb-4">
        {items.map((item) => {
          const active = pathname === item.to;
          return (
            <Link
              key={item.to}
              to={item.to}
              className={`inline-flex items-center gap-2 rounded-md px-4 py-2 text-sm font-medium ${
                active
                  ? "bg-primary text-primary-foreground"
                  : "text-foreground/80 hover:bg-muted"
              }`}
            >
              <item.icon className="h-4 w-4" />
              {item.label}
            </Link>
          );
        })}
      </nav>
      <div className="mt-6">
        <Outlet />
      </div>
    </div>
  );
}

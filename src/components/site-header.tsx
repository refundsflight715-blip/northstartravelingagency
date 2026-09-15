import { Link, useRouter } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { Menu, X, User, Phone, MessageCircle, LogOut } from "lucide-react";
import { Button } from "@/components/ui/button";
import { supabase } from "@/integrations/supabase/client";
import { site } from "@/lib/site";
import logoAsset from "@/assets/northstar-logo.jpg.asset.json";

const navItems = [
  { label: "Home", to: "/" },
  { label: "Jobs", to: "/jobs" },
  { label: "Destinations", to: "/destinations" },
  { label: "Services", to: "/services" },
  { label: "About", to: "/about" },
] as const;

export function SiteHeader() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [session, setSession] = useState<{ user?: { email?: string } } | null>(null);
  const router = useRouter();

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const { data: listener } = supabase.auth.onAuthStateChange((_event, newSession) => {
      setSession(newSession);
    });
    return () => listener.subscription.unsubscribe();
  }, []);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    setMenuOpen(false);
    router.navigate({ to: "/" });
  };

  return (
    <header className="sticky top-0 z-50 w-full border-b border-sidebar-border bg-sidebar text-sidebar-foreground">
      <div className="hidden border-b border-sidebar-border xl:block">
        <div className="container mx-auto flex h-9 items-center justify-between px-6 text-[10px] uppercase tracking-[0.16em] text-sidebar-foreground/65">
          <span>International recruitment &amp; travel guidance</span>
          <div className="flex items-center gap-6">
            <a href={`tel:${site.phone}`} className="flex items-center gap-1.5 transition-colors hover:text-primary">
              <Phone className="h-3.5 w-3.5" />
              Contact 07 62 932 660
            </a>
            <a
              href={`https://wa.me/${site.whatsapp.replace(/^\+/, "")}`}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-1.5 transition-colors hover:text-primary"
            >
              <MessageCircle className="h-3.5 w-3.5" />
              WhatsApp +254 100 922 332
            </a>
          </div>
        </div>
      </div>

      <div className="container mx-auto flex h-[74px] items-center justify-between gap-4 px-4 sm:px-6">
        <Link to="/" className="flex min-w-0 items-center gap-3" onClick={() => setMenuOpen(false)}>
          <span className="relative hidden h-9 w-9 rotate-45 items-center justify-center border border-primary sm:flex" aria-hidden="true">
            <span className="h-2.5 w-2.5 -rotate-45 bg-primary" />
          </span>
          <span className="flex flex-col leading-tight">
            <span className="truncate text-sm font-semibold uppercase text-sidebar-foreground sm:text-base">
              NorthStarTravelingAgency
            </span>
            <span className="mt-1 text-[9px] uppercase tracking-[0.32em] text-primary">
              Kenya Ltd
            </span>
          </span>
        </Link>

        <nav className="hidden items-center gap-5 xl:flex">
          {navItems.map((item) => (
            <Link
              key={item.to}
              to={item.to}
              className="text-[11px] font-medium uppercase tracking-[0.08em] text-sidebar-foreground/75 transition-colors hover:text-primary"
            >
              {item.label}
            </Link>
          ))}
        </nav>

        <div className="hidden items-center gap-2 xl:flex">
          <Button variant="ghost" size="icon" className="text-sidebar-foreground/70 hover:bg-sidebar-accent hover:text-primary" asChild title={session?.user ? "Dashboard" : "Sign in"}>
            <Link to={session?.user ? "/dashboard" : "/auth"} aria-label={session?.user ? "Dashboard" : "Sign in"}>
              <User className="h-4 w-4" />
            </Link>
          </Button>
          <Button className="h-10 rounded-none px-5 text-[10px] font-semibold uppercase tracking-[0.14em]" asChild>
            <Link to="/jobs">Apply now</Link>
          </Button>
        </div>

        <Button
          variant="ghost"
          size="icon"
          className="text-sidebar-foreground hover:bg-sidebar-accent hover:text-primary xl:hidden"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label="Toggle menu"
          aria-expanded={menuOpen}
        >
          {menuOpen ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
        </Button>
      </div>

      {menuOpen && (
        <div className="max-h-[calc(100vh-4rem)] overflow-y-auto border-t border-sidebar-border bg-sidebar px-4 py-4 xl:hidden">
          <nav className="flex flex-col">
            {navItems.map((item) => (
              <Link
                key={item.to}
                to={item.to}
                activeProps={{ className: "text-primary" }}
                activeOptions={{ exact: item.to === "/" }}
                className="border-b border-sidebar-border py-3 text-sm font-medium uppercase text-sidebar-foreground/85 hover:text-primary"
                onClick={() => setMenuOpen(false)}
              >
                {item.label}
              </Link>
            ))}
          </nav>
          <div className="my-4 space-y-3 border-b border-sidebar-border pb-4 text-xs text-sidebar-foreground/70">
            <a href={`tel:${site.phone}`} className="flex items-center gap-2 hover:text-primary"><Phone className="h-4 w-4" />07 62 932 660</a>
            <a href={`https://wa.me/${site.whatsapp.replace(/^\+/, "")}`} className="flex items-center gap-2 hover:text-primary"><MessageCircle className="h-4 w-4" />WhatsApp +254 100 922 332</a>
          </div>
          <div className="mt-4 flex flex-col gap-2">
            {session?.user ? (
              <>
                <Button asChild onClick={() => setMenuOpen(false)}>
                  <Link to="/dashboard">Dashboard</Link>
                </Button>
                <Button variant="outline" onClick={handleSignOut}>
                  <LogOut className="h-4 w-4" /> Sign out
                </Button>
              </>
            ) : (
              <>
                <Button asChild onClick={() => setMenuOpen(false)}>
                  <Link to="/jobs">Apply now</Link>
                </Button>
                <Button variant="outline" className="border-sidebar-foreground/30 bg-transparent text-sidebar-foreground hover:bg-sidebar-foreground hover:text-sidebar" asChild onClick={() => setMenuOpen(false)}>
                  <Link to="/auth">Sign in</Link>
                </Button>
              </>
            )}
          </div>
        </div>
      )}
    </header>
  );
}

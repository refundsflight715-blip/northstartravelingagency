import { Link, useRouter } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { Menu, X, User, Mail, Phone, MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { supabase } from "@/integrations/supabase/client";
import { site } from "@/lib/site";
import logoAsset from "@/assets/northstar-logo.jpg.asset.json";

const navItems = [
  { label: "Home", to: "/" },
  { label: "Jobs Abroad", to: "/jobs" },
  { label: "Destinations", to: "/destinations" },
  { label: "Services", to: "/services" },
  { label: "How to Apply", to: "/how-to-apply" },
  { label: "About Us", to: "/about" },
  { label: "FAQ", to: "/faq" },
  { label: "Contact Us", to: "/contact" },
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
    <header className="sticky top-0 z-50 w-full border-b border-border bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/80">
      <div className="hidden bg-primary text-primary-foreground md:block">
        <div className="container mx-auto flex h-9 items-center justify-between px-4 text-xs">
          <span>Recruitment &amp; travel-support services</span>
          <a href={`mailto:${site.email}`} className="flex items-center gap-2 hover:underline">
            <Mail className="h-3.5 w-3.5" />
            {site.email}
          </a>
        </div>
      </div>

      <div className="container mx-auto flex h-16 items-center justify-between gap-4 px-4">
        <Link to="/" className="flex items-center gap-2.5" onClick={() => setMenuOpen(false)}>
          <img
            src={logoAsset.url}
            alt="NorthStarTravelingAgency logo"
            width={40}
            height={40}
            className="h-10 w-10 rounded-full object-cover"
          />
          <span className="flex flex-col leading-tight">
            <span className="text-base font-bold tracking-tight text-primary sm:text-lg">
              NorthStar
              <span className="text-accent">Agency</span>
            </span>
            <span className="hidden text-[11px] uppercase tracking-widest text-muted-foreground sm:block">
              Your Journey, Our Priority
            </span>
          </span>
        </Link>

        <nav className="hidden items-center gap-5 lg:flex">
          {navItems.map((item) => (
            <Link
              key={item.to}
              to={item.to}
              activeProps={{ className: "text-primary font-semibold" }}
              activeOptions={{ exact: item.to === "/" }}
              className="text-sm font-medium text-foreground/80 transition-colors hover:text-primary"
            >
              {item.label}
            </Link>
          ))}
        </nav>

        <div className="hidden items-center gap-2 lg:flex">
          {session?.user ? (
            <>
              <Button variant="ghost" size="sm" asChild>
                <Link to="/dashboard" className="flex items-center gap-2">
                  <User className="h-4 w-4" />
                  Dashboard
                </Link>
              </Button>
              <Button variant="outline" size="sm" onClick={handleSignOut}>
                Sign out
              </Button>
            </>
          ) : (
            <>
              <Button variant="ghost" size="sm" asChild>
                <Link to="/auth">Sign in</Link>
              </Button>
              <Button size="sm" asChild>
                <Link to="/jobs">View jobs</Link>
              </Button>
            </>
          )}
        </div>

        <button
          className="inline-flex h-10 w-10 items-center justify-center rounded-md border border-border text-foreground lg:hidden"
          onClick={() => setMenuOpen(!menuOpen)}
          aria-label="Toggle menu"
          aria-expanded={menuOpen}
        >
          {menuOpen ? <X className="h-5 w-5" /> : <Menu className="h-5 w-5" />}
        </button>
      </div>

      {menuOpen && (
        <div className="max-h-[calc(100vh-4rem)] overflow-y-auto border-t border-border bg-background px-4 py-4 lg:hidden">
          <nav className="flex flex-col">
            {navItems.map((item) => (
              <Link
                key={item.to}
                to={item.to}
                activeProps={{ className: "text-primary" }}
                activeOptions={{ exact: item.to === "/" }}
                className="border-b border-border/60 py-3 text-base font-medium text-foreground/85 hover:text-primary"
                onClick={() => setMenuOpen(false)}
              >
                {item.label}
              </Link>
            ))}
          </nav>
          <div className="mt-4 flex flex-col gap-2">
            {session?.user ? (
              <>
                <Button asChild onClick={() => setMenuOpen(false)}>
                  <Link to="/dashboard">Dashboard</Link>
                </Button>
                <Button variant="outline" onClick={handleSignOut}>
                  Sign out
                </Button>
              </>
            ) : (
              <>
                <Button asChild onClick={() => setMenuOpen(false)}>
                  <Link to="/jobs">View job opportunities</Link>
                </Button>
                <Button variant="outline" asChild onClick={() => setMenuOpen(false)}>
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

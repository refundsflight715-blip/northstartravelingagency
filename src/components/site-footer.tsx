import { Link } from "@tanstack/react-router";
import { Briefcase, Mail, Phone, MessageCircle } from "lucide-react";
import { site } from "@/lib/site";

export function SiteFooter() {
  return (
    <footer className="border-t border-border bg-background">
      <div className="container mx-auto px-4 py-12">
        <div className="grid gap-8 md:grid-cols-3">
          <div>
            <Link to="/" className="flex items-center gap-2 text-xl font-bold text-primary">
              <Briefcase className="h-6 w-6 text-accent" />
              <span>NorthStarAgency</span>
            </Link>
            <p className="mt-3 text-sm text-muted-foreground">
              Connecting job seekers with overseas opportunities. Recruitment, visa guidance, and
              travel assistance in one place.
            </p>
          </div>

          <div>
            <h3 className="font-semibold text-foreground">Quick links</h3>
            <ul className="mt-3 space-y-2 text-sm text-muted-foreground">
              <li>
                <Link to="/jobs" className="hover:text-primary">
                  Browse jobs
                </Link>
              </li>
              <li>
                <Link to="/services" className="hover:text-primary">
                  Our services
                </Link>
              </li>
              <li>
                <Link to="/about" className="hover:text-primary">
                  About us
                </Link>
              </li>
              <li>
                <Link to="/contact" className="hover:text-primary">
                  Contact
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="font-semibold text-foreground">Contact</h3>
            <ul className="mt-3 space-y-2 text-sm text-muted-foreground">
              <li className="flex items-center gap-2">
                <Mail className="h-4 w-4 text-primary" />
                <a href={`mailto:${site.email}`} className="hover:text-primary">
                  {site.email}
                </a>
              </li>
              <li className="flex items-center gap-2">
                <Phone className="h-4 w-4 text-primary" />
                <a href={`tel:${site.phone}`} className="hover:text-primary">
                  {site.phone}
                </a>
              </li>
              <li className="flex items-center gap-2">
                <MessageCircle className="h-4 w-4 text-primary" />
                <a
                  href={`https://wa.me/${site.whatsapp.replace(/^\+/, "")}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="hover:text-primary"
                >
                  WhatsApp us
                </a>
              </li>
            </ul>
          </div>
        </div>

        <div className="mt-12 border-t border-border pt-6 text-center text-sm text-muted-foreground">
          &copy; {new Date().getFullYear()} NorthStarAgency. All rights reserved.
        </div>
      </div>
    </footer>
  );
}

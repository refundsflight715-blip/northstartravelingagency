import airHostess from "@/assets/portfolio-air-hostess.jpg";
import groundCrew from "@/assets/portfolio-ground-crew.jpg";
import technician from "@/assets/portfolio-aircraft-technician.jpg";
import security from "@/assets/portfolio-security.jpg";
import courier from "@/assets/portfolio-courier.jpg";
import logistics from "@/assets/portfolio-logistics.jpg";

export interface Portfolio {
  slug: string;
  title: string;
  image: string;
  tagline: string;
  regions: string[];
  partners: string;
  roles: string[];
  requirements: string[];
}

export const portfolios: Portfolio[] = [
  {
    slug: "air-hostess",
    title: "Air Hostess & Cabin Crew",
    image: airHostess,
    tagline:
      "In-flight service careers with full-service and low-cost carriers, including training and licensing support.",
    regions: ["Middle East", "Europe", "Asia", "Africa"],
    partners:
      "Placements are arranged through licensed recruitment partners working with international full-service and regional airlines.",
    roles: ["Cabin crew", "Senior flight attendant", "VIP / private jet crew", "In-flight supervisor"],
    requirements: [
      "Minimum height and reach requirements per carrier",
      "Fluent spoken English (extra languages an advantage)",
      "Customer service or hospitality experience preferred",
      "Valid passport and medical fitness clearance",
    ],
  },
  {
    slug: "ground-crew",
    title: "Airport Ground Crew",
    image: groundCrew,
    tagline:
      "Ramp, baggage, check-in and passenger handling roles at busy international hubs.",
    regions: ["Middle East", "Europe", "North America", "Asia"],
    partners:
      "Roles sit with international ground handling and airport services operators contracted to major hub airports.",
    roles: ["Ramp agent", "Baggage handler", "Check-in / passenger service agent", "Load controller"],
    requirements: [
      "Physically fit, able to work rotating shifts",
      "Basic English communication",
      "Clean criminal record for airside pass",
      "Driving licence an advantage for ramp roles",
    ],
  },
  {
    slug: "airmen-technicians",
    title: "Airmen & Aircraft Technicians",
    image: technician,
    tagline:
      "Line and base maintenance work for licensed engineers, mechanics and avionics technicians.",
    regions: ["Middle East", "Europe", "Asia", "Oceania"],
    partners:
      "Openings come from accredited MRO (maintenance, repair and overhaul) organisations and airline engineering divisions.",
    roles: ["Line maintenance technician", "Avionics technician", "Structures / sheet metal", "Engine shop mechanic"],
    requirements: [
      "Aircraft maintenance licence or recognised technical diploma",
      "1+ years hangar or line maintenance experience",
      "Ability to read technical manuals in English",
      "Willingness to work shift patterns",
    ],
  },
  {
    slug: "security",
    title: "Security Guards & Aviation Security",
    image: security,
    tagline:
      "Corporate, retail, airport screening and event security postings with licensed security firms.",
    regions: ["Middle East", "Europe", "Africa", "Asia"],
    partners:
      "Assignments run through licensed international security service providers at corporate, aviation and industrial sites.",
    roles: ["Static security officer", "Airport screening officer", "CCTV / control room operator", "Mobile patrol"],
    requirements: [
      "Security training certificate (or willingness to train)",
      "Clean police clearance certificate",
      "Good physical fitness and shift flexibility",
      "Basic English and report-writing ability",
    ],
  },
  {
    slug: "courier-delivery",
    title: "Private Courier & Delivery",
    image: courier,
    tagline:
      "Last-mile delivery, express courier and driver roles in major metropolitan markets.",
    regions: ["Europe", "Middle East", "North America", "Asia"],
    partners:
      "Vacancies are sourced from international express courier and last-mile delivery networks and their franchise operators.",
    roles: ["Van delivery driver", "Motorbike courier", "Express parcel courier", "Route supervisor"],
    requirements: [
      "Valid driving licence (category per role)",
      "Clean driving record",
      "Smartphone literacy for route apps",
      "Ability to lift parcels safely",
    ],
  },
  {
    slug: "logistics-warehouse",
    title: "Logistics & Warehouse",
    image: logistics,
    tagline:
      "Distribution centre, sorting hub and freight handling roles supporting global supply chains.",
    regions: ["Europe", "Middle East", "North America", "Oceania"],
    partners:
      "Roles are based at distribution and sorting hubs operated by global freight and e-commerce logistics companies.",
    roles: ["Warehouse operative", "Parcel sorter", "Forklift operator", "Inventory clerk"],
    requirements: [
      "Physically fit for standing shifts",
      "Forklift certificate an advantage",
      "Basic numeracy and scanner use",
      "Night and weekend shift availability",
    ],
  },
];

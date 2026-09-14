export const site = {
  name: "NorthStarTravelingAgency Kenya Ltd",
  shortName: "NorthStar",
  email: "northstaragenyweb@gmail.com",
  /** Verified phone / WhatsApp number in international format, e.g. "+254700000000". */
  phone: "+254762932660",
  whatsapp: "+254100922332",
  tagline: "Your Journey. Your Opportunity. Your Next Destination.",
  intro:
    "NorthStarAgency provides recruitment and travel-support services for individuals exploring employment opportunities and international travel.",
};

export const generalNotice =
  "Job availability, employer requirements, applicant eligibility, selection procedures, and immigration requirements vary by opportunity and destination.";

export const applicationNotice =
  "Submitting an application does not guarantee employment, a visa, or travel. Final decisions depend on the employer, recruitment process, immigration authorities, and applicable requirements.";

export const eligibilityNotice =
  "Opportunities are subject to employer selection, applicant eligibility, and applicable immigration requirements.";

export interface Destination {
  slug: string;
  name: string;
  region: string;
  blurb: string;
  sectors: string[];
  /** Values that may appear in a job's country field for this destination. */
  match: string[];
}

export const destinations: Destination[] = [
  {
    slug: "canada",
    name: "Canada",
    region: "North America",
    blurb:
      "Opportunities are commonly advertised in caregiving, hospitality, agriculture, warehousing and skilled trades. Entry requirements are set by Canadian immigration authorities.",
    sectors: ["Caregiving", "Hospitality", "Farm & agriculture", "Skilled trades"],
    match: ["Canada"],
  },
  {
    slug: "australia",
    name: "Australia",
    region: "Oceania",
    blurb:
      "Roles are often listed in agriculture, hospitality, cleaning and construction support. Eligibility depends on employer sponsorship and visa category.",
    sectors: ["Farm & agriculture", "Hospitality", "Cleaning", "Construction"],
    match: ["Australia"],
  },
  {
    slug: "europe",
    name: "Europe",
    region: "Europe",
    blurb:
      "Openings across several European countries typically cover hospitality, care support, logistics, cleaning and seasonal agricultural work.",
    sectors: ["Hospitality", "Care support", "Warehouse & logistics", "Seasonal farm work"],
    match: [
      "Europe",
      "Germany",
      "Poland",
      "Portugal",
      "Romania",
      "Netherlands",
      "United Kingdom",
      "UK",
      "Spain",
      "Italy",
      "Malta",
    ],
  },
  {
    slug: "uae",
    name: "UAE / Dubai",
    region: "Middle East",
    blurb:
      "A large market for hotel and hospitality staff, drivers, cleaners, security personnel, retail and construction support roles.",
    sectors: ["Hotel & hospitality", "Drivers", "Cleaning", "Security", "Construction"],
    match: ["UAE", "United Arab Emirates", "Dubai", "Abu Dhabi"],
  },
  {
    slug: "qatar",
    name: "Qatar",
    region: "Middle East",
    blurb:
      "Advertised roles frequently include hospitality, facilities and cleaning services, drivers, security and construction trades.",
    sectors: ["Hospitality", "Facilities & cleaning", "Drivers", "Construction"],
    match: ["Qatar", "Doha"],
  },
  {
    slug: "kuwait",
    name: "Kuwait",
    region: "Middle East",
    blurb:
      "Opportunities are commonly listed in domestic and cleaning services, catering, drivers and general labour support.",
    sectors: ["Cleaning", "Kitchen & catering", "Drivers", "Domestic work"],
    match: ["Kuwait"],
  },
  {
    slug: "oman",
    name: "Oman",
    region: "Middle East",
    blurb:
      "Positions are often available in hospitality, facilities management, technical support roles and general services.",
    sectors: ["Hospitality", "Facilities", "Technicians", "General services"],
    match: ["Oman", "Muscat"],
  },
  {
    slug: "saudi-arabia",
    name: "Saudi Arabia",
    region: "Middle East",
    blurb:
      "One of the largest regional markets, with listings in construction, hospitality, drivers, cleaning, catering and technical trades.",
    sectors: ["Construction", "Hospitality", "Drivers", "Technicians"],
    match: ["Saudi Arabia", "KSA", "Riyadh", "Jeddah"],
  },
  {
    slug: "other",
    name: "Other Destinations",
    region: "Worldwide",
    blurb:
      "We also share opportunities in other countries as they become available through our recruitment contacts. Contact us to ask about a specific destination.",
    sectors: ["Varies by opportunity"],
    match: [],
  },
];

export const jobCategories = [
  "Drivers",
  "Cleaners",
  "Caregivers",
  "Hotel & Hospitality",
  "Construction & Skilled Trades",
  "Warehouse & Packing",
  "Farm & Agricultural Work",
  "Kitchen & Catering",
  "Security",
  "Technicians",
  "Nanny & Domestic Work",
  "Other Available Positions",
];

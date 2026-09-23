// Backend automated notification sender for candidate application submissions
export interface AdminApplicationNotification {
  applicantName: string;
  applicantEmail: string;
  applicantPhone: string;
  jobCategory?: string | null;
  countryOfInterest?: string | null;
  applicationId: string;
  submittedAt: string;
}

export async function sendAdminApplicationNotification(data: AdminApplicationNotification): Promise<boolean> {
  const adminEmail = process.env.ADMIN_NOTIFICATION_EMAIL || "northstaragencyweb@gmail.com";
  const resendApiKey = process.env.RESEND_API_KEY;

  if (!resendApiKey) {
    console.warn("[Email] RESEND_API_KEY not configured. Notification not dispatched to", adminEmail);
    return false;
  }

  const subject = "New Client Application - NorthstarTravelingAgency";
  const htmlBody = ;

  try {
    const response = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        Authorization: ,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "NorthStar Agency <notifications@resend.dev>",
        to: [adminEmail],
        subject,
        html: htmlBody,
      }),
    });

    if (!response.ok) {
      const errText = await response.text();
      console.error("[Email] Failed to send notification via Resend:", response.status, errText);
      return false;
    }
    return true;
  } catch (err) {
    console.error("[Email] Exception while sending email notification:", err);
    return false;
  }
}

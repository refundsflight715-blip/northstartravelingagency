import { createFileRoute } from "@tanstack/react-router";
import { queryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { profileSchema, type ProfileInput } from "@/lib/schemas";
import { getMyProfile, updateProfile } from "@/lib/profiles.functions";
import { useServerFn } from "@tanstack/react-start";
import { toast } from "sonner";

const profileQueryOptions = queryOptions({
  queryKey: ["my-profile"],
  queryFn: () => getMyProfile(),
});

export const Route = createFileRoute("/_authenticated/profile")({
  head: () => ({
    meta: [
      { title: "My Profile | NorthStarAgency" },
      { name: "description", content: "Update your candidate profile." },
      { property: "og:title", content: "My Profile | NorthStarAgency" },
      { property: "og:description", content: "Update your candidate profile." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  loader: ({ context }) => context.queryClient.ensureQueryData(profileQueryOptions),
  component: ProfilePage,
});

function ProfilePage() {
  const { data: profile } = useSuspenseQuery(profileQueryOptions);
  const updateFn = useServerFn(updateProfile);

  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<ProfileInput>({
    resolver: zodResolver(profileSchema),
    defaultValues: {
      full_name: profile.full_name ?? "",
      phone: profile.phone ?? "",
      country: profile.country ?? "",
      bio: profile.bio ?? "",
      resume_url: profile.resume_url ?? "",
    },
  });

  const onSubmit = async (values: ProfileInput) => {
    try {
      await updateFn({ data: values });
      toast.success("Profile updated.");
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Failed to update profile.");
    }
  };

  return (
    <div className="container mx-auto max-w-2xl px-4 py-16 md:py-24">
      <Card>
        <CardHeader>
          <h1 className="text-2xl font-bold text-foreground">My profile</h1>
          <p className="text-sm text-muted-foreground">
            Keep your details up to date so employers can review your application.
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="full_name">Full name</Label>
              <Input id="full_name" {...register("full_name")} />
              {errors.full_name && (
                <p className="text-sm text-destructive">{errors.full_name.message}</p>
              )}
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label htmlFor="phone">Phone</Label>
                <Input id="phone" {...register("phone")} />
              </div>
              <div className="space-y-2">
                <Label htmlFor="country">Country of residence</Label>
                <Input id="country" {...register("country")} />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="bio">Bio / experience summary</Label>
              <Textarea id="bio" rows={5} {...register("bio")} />
            </div>
            <div className="space-y-2">
              <Label htmlFor="resume_url">Resume URL</Label>
              <Input id="resume_url" type="url" {...register("resume_url")} />
            </div>
            <Button type="submit" className="w-full" disabled={isSubmitting}>
              {isSubmitting ? "Saving..." : "Save profile"}
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}

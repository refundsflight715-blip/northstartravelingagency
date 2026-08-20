import { createFileRoute, Link, useRouter } from "@tanstack/react-router";
import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { Eye, EyeOff, Loader2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { lovable } from "@/integrations/lovable";
import { supabase } from "@/integrations/supabase/client";
import { z } from "zod";
import { toast } from "sonner";

const authSchema = z.object({
  email: z.string().email("Valid email is required"),
  password: z.string().min(6, "Password must be at least 6 characters"),
  full_name: z.string().optional(),
});

type AuthForm = z.infer<typeof authSchema>;

export const Route = createFileRoute("/auth")({
  head: () => ({
    meta: [
      { title: "Sign In | NorthStarAgency" },
      { name: "description", content: "Sign in or create an account with NorthStarAgency." },
      { property: "og:title", content: "Sign In | NorthStarAgency" },
      { property: "og:description", content: "Sign in or create an account." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: AuthPage,
});

function AuthPage() {
  const [mode, setMode] = useState<"signin" | "signup">("signin");
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<AuthForm>({ resolver: zodResolver(authSchema) });

  const onSubmit = async (values: AuthForm) => {
    setLoading(true);
    try {
        if (mode === "signup") {
        const { error, data } = await supabase.auth.signUp({
          email: values.email,
          password: values.password,
          options: { data: { full_name: values.full_name ?? "" } },
        });
        if (error) throw error;
        if (data.user) {
          await supabase.from("profiles").insert({
            user_id: data.user.id,
            full_name: values.full_name ?? null,
          });
          toast.success("Account created. Please check your email to confirm.");
        }
      } else {
        const { error } = await supabase.auth.signInWithPassword({
          email: values.email,
          password: values.password,
        });
        if (error) throw error;
        toast.success("Signed in successfully.");
        router.navigate({ to: "/dashboard" });
      }
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Authentication failed.");
    } finally {
      setLoading(false);
    }
  };

  const signInWithGoogle = async () => {
    const result = await lovable.auth.signInWithOAuth("google", {
      redirect_uri: window.location.origin,
    });
    if (result.error) {
      toast.error(result.error.message || "Google sign in failed.");
    }
  };

  return (
    <div className="container mx-auto flex max-w-md items-center px-4 py-16 md:py-24">
      <Card className="w-full">
        <CardHeader>
          <h1 className="text-2xl font-bold text-foreground">Welcome to NorthStar</h1>
          <p className="text-sm text-muted-foreground">
            Sign in to apply for jobs or create a new account.
          </p>
        </CardHeader>
        <CardContent>
          <Tabs value={mode} onValueChange={(v) => setMode(v as typeof mode)}>
            <TabsList className="grid w-full grid-cols-2">
              <TabsTrigger value="signin">Sign in</TabsTrigger>
              <TabsTrigger value="signup">Create account</TabsTrigger>
            </TabsList>
            <TabsContent value="signin">
              <AuthFields
                mode="signin"
                register={register}
                errors={errors}
                showPassword={showPassword}
                setShowPassword={setShowPassword}
                loading={loading}
                onSubmit={handleSubmit(onSubmit)}
                googleSignIn={signInWithGoogle}
              />
            </TabsContent>
            <TabsContent value="signup">
              <AuthFields
                mode="signup"
                register={register}
                errors={errors}
                showPassword={showPassword}
                setShowPassword={setShowPassword}
                loading={loading}
                onSubmit={handleSubmit(onSubmit)}
                googleSignIn={signInWithGoogle}
              />
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>
    </div>
  );
}

function AuthFields({
  mode,
  register,
  errors,
  showPassword,
  setShowPassword,
  loading,
  onSubmit,
  googleSignIn,
}: {
  mode: "signin" | "signup";
  register: ReturnType<typeof useForm<AuthForm>>["register"];
  errors: ReturnType<typeof useForm<AuthForm>>["formState"]["errors"];
  showPassword: boolean;
  setShowPassword: (v: boolean) => void;
  loading: boolean;
  onSubmit: () => void;
  googleSignIn: () => void;
}) {
  return (
    <form onSubmit={onSubmit} className="space-y-4 pt-2">
      {mode === "signup" && (
        <div className="space-y-2">
          <Label htmlFor="full_name">Full name</Label>
          <Input id="full_name" {...register("full_name")} />
        </div>
      )}
      <div className="space-y-2">
        <Label htmlFor="email">Email</Label>
        <Input id="email" type="email" {...register("email")} />
        {errors.email && <p className="text-sm text-destructive">{errors.email.message}</p>}
      </div>
      <div className="space-y-2">
        <Label htmlFor="password">Password</Label>
        <div className="relative">
          <Input
            id="password"
            type={showPassword ? "text" : "password"}
            {...register("password")}
          />
          <button
            type="button"
            className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground"
            onClick={() => setShowPassword(!showPassword)}
          >
            {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
          </button>
        </div>
        {errors.password && (
          <p className="text-sm text-destructive">{errors.password.message}</p>
        )}
      </div>
      <Button type="submit" className="w-full" disabled={loading}>
        {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
        {mode === "signin" ? "Sign in" : "Create account"}
      </Button>
      <div className="relative py-2">
        <div className="absolute inset-0 flex items-center">
          <span className="w-full border-t border-border" />
        </div>
        <div className="relative flex justify-center text-xs uppercase">
          <span className="bg-card px-2 text-muted-foreground">Or</span>
        </div>
      </div>
      <Button type="button" variant="outline" className="w-full" onClick={googleSignIn}>
        Continue with Google
      </Button>
      <p className="text-center text-sm text-muted-foreground">
        {mode === "signin" ? "Don't have an account? " : "Already have an account? "}
        <button
          type="button"
          className="font-medium text-primary hover:underline"
          onClick={() => {}}
        >
          {mode === "signin" ? "Create one" : "Sign in"}
        </button>
      </p>
    </form>
  );
}

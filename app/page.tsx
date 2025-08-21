"use client";
import { useState } from "react";
import { supabase } from "../lib/supabase";

export default function Home() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const handleLogin = async () => {
    const { error } = await supabase.auth.signInWithOtp({ email });
    if (error) setMessage(error.message);
    else setMessage("Check your email for a magic link!");
  };
  return (
    <div>
      <h1>Team Tasks</h1>
      <input type="email" placeholder="Your email" value={email} onChange={(e) => setEmail(e.target.value)} />
      <button onClick={handleLogin}>Sign in</button>
      <p>{message}</p>
    </div>
  );
}

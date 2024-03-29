import type { Metadata } from "next";
import { DM_Sans } from "next/font/google";
import "./globals.css";
import { paragraph } from "./utils/font-loaders";

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={paragraph.className}>{children}</body>
    </html>
  );
}

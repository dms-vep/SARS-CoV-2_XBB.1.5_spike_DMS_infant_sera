import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "SARS-CoV-2 XBB.1.5 spike escape from adult vs infant sera",
  description:
    "Pseudovirus deep mutational scanning of mutations to XBB.1.5 spike that reduce neutralization by sera from humans with different exposure histories",
  base: "/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera/",
  appearance: false,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Appendix", link: "/appendix", target: "_self" },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/dms-vep/SARS-CoV-2_XBB.1.5_spike_DMS_infant_sera" }],
    footer: {
      message: 'See <a href="https://www.biorxiv.org/content/10.1101/2025.01.17.633612v1">Dadonaite et al (2025)</a> for study details',
    },
  },
});

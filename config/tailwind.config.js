const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        kollektiff: ["Kollektiff", "sans-serif"],
        gidole: ["Gidole", "sans-serif"],
        // sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      fontWeight: {
        "kollektiff-bold": "700",
      },
      colors: {},
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("flowbite/plugin"),
    require("preline/plugin"),
  ],
};

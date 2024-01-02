const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      fontFamily: {
        'russo': ['Russo One', 'sans-serif'],
        'sans': ['Roboto', ...defaultTheme.fontFamily.sans],
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

const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
<<<<<<< HEAD

=======
>>>>>>> a6b73dba733a7528bf0f36b9cf1bfd8ac63ea6cc
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
<<<<<<< HEAD

=======
>>>>>>> a6b73dba733a7528bf0f36b9cf1bfd8ac63ea6cc
  ],
};

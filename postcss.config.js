const purgecss = require("@fullhuman/postcss-purgecss")({
  content: ["./app/views/**/*.html.erb"],
  defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
})

module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
    ...(process.env.NODE_ENV === "production" ? [purgecss] : [])
  ]
}

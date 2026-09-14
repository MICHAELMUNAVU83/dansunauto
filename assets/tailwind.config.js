// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/dansunauto_web.ex",
    "../lib/dansunauto_web/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        // Design reference: tailwind.html
        ink:  "#2A2A2A",
        body: "#57575A",
        line: "#E9E9E9",
        mute: "#B9BBBC",
        brand: {
          DEFAULT: "#BB0A07",
          50:  "#fff0f2",
          100: "#ffd6db",
          200: "#ffadb6",
          300: "#ff7384",
          400: "#ff3a52",
          500: "#ff0a27",
          600: "#C8001F",
          700: "#a00019",
          800: "#7a0014",
          900: "#55000e",
        },
      },
      fontFamily: {
        sans:    ["Lexend", "ui-sans-serif", "system-ui", "sans-serif"],
        display: ["Manrope", "Lexend", "sans-serif"],
        serif:   ['"Libre Baskerville"', "Georgia", "serif"],
        script:  ["Dancing Script", "cursive"],
        ui:      ["Inter", "ui-sans-serif", "system-ui", "sans-serif"],
      },
      maxWidth: { wrap: "1280px" },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}

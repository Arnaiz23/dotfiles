#!/bin/sh

# Check if gum is installed

actual_directory="$(pwd)"

# Check if the actual directory is a javascript project
if [ ! -e "$actual_directory/package.json" ]; then
    echo "No project"
fi

# Select the package manager
package=$(gum choose "bun" "pnpm" "npm" "yarn")
subpackage="npx"

# Select beetween Astro, NextJS or React
technologie=$(gum choose "Astro" "React" "NextJS")

case $technologie in
    "Astro")
        gum confirm "TypeScript?" && ts="@typescript-eslint/parser"
        $package install -D prettier prettier-plugin-astro eslint eslint-plugin-astro $ts

        # Loader
        echo 'module.exports = {
            extends: [
              "plugin:astro/recommended",
            ],
            overrides: [
              {
                files: ["*.astro"],
                parser: "astro-eslint-parser",
                parserOptions: {
                  parser: "@typescript-eslint/parser",
                  extraFileExtensions: [".astro"],
                },
                rules: {
                },
              },
            ],
        }' > .eslintrc.cjs

        echo "
          /** @type {import('prettier').Config} */
          export default {
            plugins: ['prettier-plugin-astro'],
          };
        " > .prettierrc.mjs

        echo "📝Create the .eslintrc file and execute prettier and eslint...📝"

        # Execute the prettier . --write & eslint "src/**/*.{js,astro}"
        $subpackage eslint "src/**/*.{js,astro}" && $subpackage prettier . --write
        ;;
    "React")
        $package install -D prettier eslint eslint-config-prettier
        ;;
    "NextJS")
        $package install -D prettier eslint eslint-config-prettier
        ;;
esac

# Maybe add eslint-plugin-import or anothers?
# Loader: gum spin --spinner dot --title "Buying Bubble Gum..." -- sleep 5

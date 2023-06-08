#!/bin/bash

# Exit if any subcommand fails
set -e

# Build the site
bundle exec jekyll build

# Switch to the gh-pages branch
git checkout gh-pages

touch .nojekyll

# Move the built site to the root
rsync -avr --exclude='.git' --exclude='deploy.sh' _site/ .

# Add, commit, and push the changes
git add --all
git commit -m "Deploy site to gh-pages"
git push -f origin gh-pages

# Switch back to the original branch
git checkout -

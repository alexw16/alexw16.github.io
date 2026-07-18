#!/bin/bash

# Exit if any subcommand fails
set -e

# Build the site
bundle exec jekyll build

# Switch to the gh-pages branch
git checkout gh-pages

# Move the built site to the root, removing stale files (old source dirs,
# previously built pages, etc.) that are no longer part of the build
rsync -avr --delete --exclude='.git' --exclude='deploy.sh' --exclude='.nojekyll' _site/ .

touch .nojekyll

# Add, commit, and push the changes
git add --all
git commit -m "Deploy site to gh-pages"
git push -f origin gh-pages

# Switch back to the original branch
git checkout -

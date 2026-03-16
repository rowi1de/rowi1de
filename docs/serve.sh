#!/bin/bash
# Serve the Jekyll site locally for preview.
# Usage: ./serve.sh [port]
#
# Requires: gem install bundler && bundle install

set -euo pipefail
PORT="${1:-4000}"

if ! command -v bundle &>/dev/null; then
  echo "Install bundler first: gem install bundler"
  exit 1
fi

if [ ! -f Gemfile.lock ]; then
  bundle install
fi

echo "Serving at http://localhost:$PORT (Ctrl+C to stop)"
bundle exec jekyll serve --port "$PORT" --livereload

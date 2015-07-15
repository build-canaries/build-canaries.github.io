#!/bin/bash -e

hash bundle 2>/dev/null || {
    echo >&2 "bundle command not found, you need to install bundler.  Try gem install bundler"
    exit 1
}

echo "Getting ruby dependencies"
bundle install

echo "Serving up pages"
bundle exec jekyll serve

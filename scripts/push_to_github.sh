#!/usr/bin/env bash
set -euo pipefail

# Usage:
# GITHUB_REPO="https://github.com/username/repo.git" GITHUB_TOKEN="ghp_..." ./scripts/push_to_github.sh

if [ -z "${GITHUB_REPO:-}" ]; then
  echo "Please set GITHUB_REPO environment variable to your repo URL (https://github.com/username/repo.git)"
  exit 1
fi

if [ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null || true)" ]; then
  git init
fi

git add .
if git show-ref --verify --quiet refs/heads/main; then
  git checkout main
else
  git checkout -b main
fi

git commit -m "chore: add Anyfeast UI" || true

# Add remote
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$GITHUB_REPO"
else
  git remote add origin "$GITHUB_REPO"
fi

# If token provided, use it to push (embedded URL)
if [ -n "${GITHUB_TOKEN:-}" ]; then
  auth_url=$(echo "$GITHUB_REPO" | sed -E "s#https://#https://${GITHUB_TOKEN}@#")
  git push -u "$auth_url" main
else
  echo "No GITHUB_TOKEN provided. Attempting to push using your configured credentials."
  git push -u origin main
fi

echo "Pushed to $GITHUB_REPO"
#!/usr/bin/env bash
set -euo pipefail

RELEASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GITHUB_REPO="${GITHUB_REPO:-}"

if [[ -z "$GITHUB_REPO" ]]; then
  echo "GITHUB_REPO is required, for example: hotwheelsBo/petly-release" >&2
  exit 1
fi

cd "$RELEASE_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init
fi

git add README.md CHANGELOG.md RELEASE.md PRIVACY.md TERMS.md .gitignore publish-github-release.sh setup-public-repo.sh
git commit -m "docs: add Petly public release docs" || true

if git remote get-url github >/dev/null 2>&1; then
  git remote set-url github "git@github.com:${GITHUB_REPO}.git"
else
  git remote add github "git@github.com:${GITHUB_REPO}.git"
fi

echo "release/ is ready. If the GitHub repo does not exist yet, create it as a public empty repository first:"
echo "  gh repo create ${GITHUB_REPO} --public --source . --remote github --push"
echo
echo "If the GitHub repo already exists, push with:"
echo "  git push -u github HEAD"


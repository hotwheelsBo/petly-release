#!/usr/bin/env bash
set -euo pipefail

RELEASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$RELEASE_DIR/.." && pwd)"
DIST_DIR="$ROOT_DIR/app/apps/desktop/dist-electron"

VERSION="${VERSION:-v1.0.0}"
GITHUB_REPO="${GITHUB_REPO:-}"

if [[ -z "$GITHUB_REPO" ]]; then
  echo "GITHUB_REPO is required, for example: hotwheelsBo/petly-release" >&2
  exit 1
fi

ASSETS=(
  "$DIST_DIR/Petly-latest-mac-arm64.dmg"
  "$DIST_DIR/Petly-latest-mac-x64.dmg"
  "$DIST_DIR/Petly-latest-win-x64-setup.exe"
  "$DIST_DIR/Petly-latest-linux-x86_64.AppImage"
  "$DIST_DIR/SHA256SUMS"
)

for asset in "${ASSETS[@]}"; do
  if [[ ! -f "$asset" ]]; then
    echo "Missing release asset: $asset" >&2
    exit 1
  fi
done

cd "$RELEASE_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "release/ is not a git repository. Run ./setup-public-repo.sh first." >&2
  exit 1
fi

git diff --quiet || {
  echo "release/ has uncommitted changes. Commit them before publishing." >&2
  exit 1
}

if ! git rev-parse "$VERSION" >/dev/null 2>&1; then
  git tag "$VERSION"
fi

git push github HEAD
git push github "$VERSION"

if gh release view "$VERSION" --repo "$GITHUB_REPO" >/dev/null 2>&1; then
  gh release upload "$VERSION" --repo "$GITHUB_REPO" --clobber "${ASSETS[@]}"
else
  gh release create "$VERSION" \
    --repo "$GITHUB_REPO" \
    --title "Petly ${VERSION#v}" \
    --notes-file RELEASE.md \
    "${ASSETS[@]}"
fi

echo "Published GitHub release $VERSION to $GITHUB_REPO"


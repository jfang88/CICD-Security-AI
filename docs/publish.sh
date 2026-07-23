#!/usr/bin/env bash
#
# publish.sh — commit the architecture pack to GitHub and raise the decision/action issues.
#
# Requires: gh (GitHub CLI), authenticated as a user with write access to the target repo.
#   brew install gh   (or see https://cli.github.com)
#   gh auth login
#
# Usage:
#   ./scripts/publish.sh --dry-run                 # show what would happen, change nothing
#   ./scripts/publish.sh                           # branch + PR (default, recommended)
#   ./scripts/publish.sh --direct                  # commit straight to the default branch
#   ./scripts/publish.sh --docs-only               # commit docs, skip issue creation
#   ./scripts/publish.sh --issues-only             # create issues, skip the commit
#
set -euo pipefail

REPO="${REPO:-jfang88/CICD-Security-AI}"
BRANCH="${BRANCH:-docs/ai-devsecops-architecture}"
DOCS_SUBDIR="${DOCS_SUBDIR:-docs}"

DRY_RUN=false
DIRECT=false
DO_DOCS=true
DO_ISSUES=true

for arg in "$@"; do
  case "$arg" in
    --dry-run)     DRY_RUN=true ;;
    --direct)      DIRECT=true ;;
    --docs-only)   DO_ISSUES=false ;;
    --issues-only) DO_DOCS=false ;;
    -h|--help)     sed -n '2,20p' "$0"; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; exit 1 ;;
  esac
done

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC_ROOT="$( dirname "$SCRIPT_DIR" )"
ISSUE_DIR="$SCRIPT_DIR/issues"

say () { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
run () { if $DRY_RUN; then printf '   [dry-run] %s\n' "$*"; else eval "$@"; fi; }

# ---------------------------------------------------------------- preflight
command -v gh >/dev/null 2>&1 || { echo "gh CLI not found. See https://cli.github.com" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "gh is not authenticated. Run: gh auth login" >&2; exit 1; }

say "Target repo: $REPO"
if ! gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Cannot access $REPO. Check the name, your permissions, and that the repo exists." >&2
  exit 1
fi
DEFAULT_BRANCH="$(gh repo view "$REPO" --json defaultBranchRef -q .defaultBranchRef.name)"
say "Default branch: $DEFAULT_BRANCH"

# ---------------------------------------------------------------- documents
if $DO_DOCS; then
  WORK="$(mktemp -d)"
  trap 'rm -rf "$WORK"' EXIT
  say "Cloning into $WORK"
  run "gh repo clone '$REPO' '$WORK/repo' -- --depth 1 --quiet"

  if ! $DRY_RUN; then
    cd "$WORK/repo"
    mkdir -p "$DOCS_SUBDIR"
    cp "$SRC_ROOT/docs/01-architecture-option-pack.md" "$DOCS_SUBDIR/"
    cp "$SRC_ROOT/docs/02-arb-review-checklist.md"     "$DOCS_SUBDIR/"
    cp "$SRC_ROOT/docs/03-open-decisions.md"           "$DOCS_SUBDIR/"
    cp "$SRC_ROOT/README.md"                           "$DOCS_SUBDIR/README.md"
    mkdir -p scripts && cp -r "$SCRIPT_DIR" scripts/ 2>/dev/null || true

    if $DIRECT; then
      git checkout "$DEFAULT_BRANCH" --quiet
    else
      git checkout -b "$BRANCH" --quiet
    fi

    git add "$DOCS_SUBDIR"
    if git diff --cached --quiet; then
      say "No document changes to commit."
    else
      git -c user.name="${GIT_AUTHOR_NAME:-$(git config user.name || echo 'Architecture')}" \
          -c user.email="${GIT_AUTHOR_EMAIL:-$(git config user.email || echo 'architecture@localhost')}" \
          commit --quiet -m "docs: AI-enabled secure delivery architecture option pack

Target-state reference architecture for an AI-enabled secure software
delivery pipeline. Covers the full lifecycle from demand intake through
sustainment, three architecture options with weighted comparison, the
control and trust-zone model, governance and operating model, and a
0-36 month roadmap gated on platform readiness.

Open decisions, actions and review notes are in docs/03-open-decisions.md
and raised as issues."
      if $DIRECT; then
        git push origin "$DEFAULT_BRANCH" --quiet
        say "Pushed to $DEFAULT_BRANCH"
      else
        git push -u origin "$BRANCH" --quiet
        PR_URL="$(gh pr create --repo "$REPO" \
          --title "docs: AI-enabled secure delivery architecture option pack" \
          --body "Adds the target-state architecture option pack, the ARB conformance checklist, and the open decisions register.

Companion issues cover the decisions and actions that need owners. See \`docs/03-open-decisions.md\`.

Worth reviewing first:
- §7.4 option scores use **illustrative weights** that need re-setting by the ARB
- §9.1 adds a seventh control point (agent action) beyond the original scope — see the CP7 review note issue
- §6.6 lists eight load-bearing assumptions that change the recommendation if false" \
          --base "$DEFAULT_BRANCH" --head "$BRANCH")"
        say "Pull request: $PR_URL"
      fi
    fi
    cd - >/dev/null
  else
    say "[dry-run] would copy 4 files into $DOCS_SUBDIR/ and open a PR from $BRANCH"
  fi
fi

# ------------------------------------------------------------------ labels
if $DO_ISSUES; then
  say "Ensuring labels exist"
  create_label () {
    if $DRY_RUN; then printf '   [dry-run] label: %s\n' "$1"; return; fi
    gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force >/dev/null 2>&1 || true
  }
  create_label "decision"    "5319E7" "A choice that must be made"
  create_label "action"      "0E8A16" "Work to schedule and own"
  create_label "note"        "FBCA04" "Caveat or review note, no action yet"
  create_label "phase-0"     "1D76DB" "Foundations, 0-6 months"
  create_label "phase-1"     "1D76DB" "Controlled augmentation, 6-12 months"
  create_label "phase-2"     "1D76DB" "Agentic integration, 12-24 months"
  create_label "arb"         "B60205" "Architecture Review Board"
  create_label "governance"  "D93F0B" "Governance and operating model"
  create_label "security"    "B60205" "Security engineering"
  create_label "platform"    "006B75" "Platform engineering"
  create_label "compliance"  "C2E0C6" "Compliance and audit"
  create_label "measurement" "BFD4F2" "Metrics and measurement"
  create_label "priority"    "E99695" "Start now"
  create_label "gate"        "000000" "Blocking gate"
  create_label "review-me"   "FEF2C0" "Please push back on this"

  # ------------------------------------------------------------- issues
  say "Creating issues"
  shopt -s nullglob
  for f in "$ISSUE_DIR"/*.md; do
    title="$(sed -n 's/^TITLE: //p' "$f" | head -1)"
    labels="$(sed -n 's/^LABELS: //p' "$f" | head -1)"
    body="$(sed -n '/^BODY:$/,$p' "$f" | tail -n +2)"

    [ -n "$title" ] || { echo "Skipping $f — no TITLE" >&2; continue; }

    if $DRY_RUN; then
      printf '   [dry-run] issue: %s  [%s]\n' "$title" "$labels"
      continue
    fi

    # Skip if an open issue with this exact title already exists
    existing="$(gh issue list --repo "$REPO" --state open --search "$title in:title" --json title -q '.[].title' 2>/dev/null || true)"
    if printf '%s\n' "$existing" | grep -Fxq "$title"; then
      printf '   skip (exists): %s\n' "$title"
      continue
    fi

    url="$(printf '%s' "$body" | gh issue create --repo "$REPO" \
      --title "$title" --label "$labels" --body-file -)"
    printf '   created: %s\n   %s\n' "$title" "$url"
  done
fi

say "Done."
$DRY_RUN && say "That was a dry run. Re-run without --dry-run to apply."
exit 0

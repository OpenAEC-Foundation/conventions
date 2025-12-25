#!/bin/bash

# Sync shared files from https://github.com/pexlit/Conventions
# Run this to update shared agents, conventions, and this script itself

set -e

REPO="pexlit/Conventions"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"
SELF="$(realpath "$0")"

# Self-update and re-exec if not already updated
if [ "$1" != "--updated" ]; then
    echo "Updating sync_shared.sh..."
    curl -fsSL "$BASE_URL/sync_shared.sh" -o "$SELF.tmp"
    mv "$SELF.tmp" "$SELF"
    chmod +x "$SELF"
    exec "$SELF" --updated
fi

# Download CONVENTIONS.md
echo "Downloading CONVENTIONS.md..."
curl -fsSL "$BASE_URL/conventions.md" -o CONVENTIONS.md

# Download .claude/agents/ files
echo "Downloading .claude/agents/..."
mkdir -p .claude/agents

# Get list of agent files from GitHub API
AGENTS=$(curl -fsSL "https://api.github.com/repos/$REPO/contents/.claude/agents?ref=$BRANCH" 2>/dev/null | grep '"name"' | cut -d'"' -f4)

for agent in $AGENTS; do
    echo "  - $agent"
    curl -fsSL "$BASE_URL/.claude/agents/$agent" -o ".claude/agents/$agent"
done

# Add synced files to .gitignore if not already present
echo "Updating .gitignore..."
touch .gitignore

for entry in "CONVENTIONS.md" ".claude/"; do
    if ! grep -qxF "$entry" .gitignore; then
        echo "$entry" >> .gitignore
        echo "  Added $entry to .gitignore"
    fi
done

echo "Done!"

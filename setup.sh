#!/bin/bash
# Claude Code one-line remote setup
# Usage: bash <(curl -sL -H "Authorization: Bearer $T" -H "Accept: application/vnd.github.v3.raw" https://api.github.com/repos/gkswns0531/claude-config/contents/setup.sh) <GITHUB_TOKEN>
# Or:    bash setup.sh <GITHUB_TOKEN>
set -e

TOKEN="${1:-$GITHUB_TOKEN}"

if [ -z "$TOKEN" ]; then
    echo "Usage: bash setup.sh <GITHUB_TOKEN>"
    echo "  or:  GITHUB_TOKEN=xxx bash setup.sh"
    exit 1
fi

REPO_DIR="$(mktemp -d)/claude-config"

echo "=== Claude Code Remote Setup ==="

# 1. Clone private repo via HTTPS + PAT
echo "[..] Cloning config repo..."
git clone --quiet "https://${TOKEN}@github.com/gkswns0531/claude-config.git" "$REPO_DIR"
echo "[OK] Repo cloned"

# 2. Copy config files
mkdir -p "$HOME/.claude/commands" "$HOME/.claude/hooks"

cp "$REPO_DIR/.claude/settings.json" "$HOME/.claude/settings.json"
cp "$REPO_DIR/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
cp "$REPO_DIR/.claude/commands/"*.md "$HOME/.claude/commands/"
cp "$REPO_DIR/.claude/hooks/"*.sh "$HOME/.claude/hooks/"
chmod +x "$HOME/.claude/hooks/"*.sh

echo "[OK] ~/.claude/ config installed"

# 3. Set up .env_secrets
if [ ! -f "$HOME/.env_secrets" ]; then
    cp "$REPO_DIR/.env_secrets.example" "$HOME/.env_secrets"
    echo "[!!] ~/.env_secrets created - fill in your API keys: vi ~/.env_secrets"
else
    echo "[OK] ~/.env_secrets already exists"
fi

# 4. Source in shell rc
SHELL_RC="$HOME/.zshrc"
[ ! -f "$SHELL_RC" ] && SHELL_RC="$HOME/.bashrc"
[ ! -f "$SHELL_RC" ] && touch "$SHELL_RC"

if ! grep -q 'source.*\.env_secrets' "$SHELL_RC" 2>/dev/null; then
    echo 'source ~/.env_secrets' >> "$SHELL_RC"
    echo "[OK] Added source to $SHELL_RC"
fi

# 5. Cleanup cloned repo
rm -rf "$REPO_DIR"

# 6. Dependency check
echo ""
echo "=== Dependencies ==="
for cmd in node npx jq; do
    if command -v "$cmd" &>/dev/null; then
        echo "[OK] $cmd"
    else
        echo "[!!] $cmd - MISSING"
    fi
done
command -v docker &>/dev/null && echo "[OK] docker" || echo "[--] docker (optional)"

echo ""
echo "=== Done ==="
echo "1. Fill API keys:  vi ~/.env_secrets"
echo "2. Reload shell:   source ~/.env_secrets"
echo "3. Login Claude:   claude login"

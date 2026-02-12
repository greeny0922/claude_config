#!/bin/bash
# Claude Code one-line remote setup
# Usage: T=<TOKEN> && bash <(curl -sL -H "Authorization: Bearer $T" -H "Accept: application/vnd.github.v3.raw" https://api.github.com/repos/gkswns0531/claude-config/contents/setup.sh) "$T"
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
    echo "[!!] ~/.env_secrets created from template"
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

# 6. Install missing dependencies
echo ""
echo "=== Installing Dependencies ==="

if ! command -v jq &>/dev/null; then
    if command -v apt-get &>/dev/null; then
        apt-get update -qq && apt-get install -y -qq jq >/dev/null 2>&1 && echo "[OK] jq installed" || echo "[!!] jq install failed"
    elif command -v yum &>/dev/null; then
        yum install -y -q jq >/dev/null 2>&1 && echo "[OK] jq installed" || echo "[!!] jq install failed"
    elif command -v apk &>/dev/null; then
        apk add --quiet jq >/dev/null 2>&1 && echo "[OK] jq installed" || echo "[!!] jq install failed"
    else
        echo "[!!] jq - MISSING (install manually)"
    fi
else
    echo "[OK] jq"
fi

if ! command -v node &>/dev/null; then
    echo "[..] Installing Node.js via nvm..."
    curl -so- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash >/dev/null 2>&1
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts >/dev/null 2>&1 && echo "[OK] Node.js $(node --version) installed" || echo "[!!] Node.js install failed"
else
    echo "[OK] node $(node --version)"
fi

command -v docker &>/dev/null && echo "[OK] docker" || echo "[--] docker (optional, for GitHub MCP)"

echo ""
echo "=== Done ==="
echo "Next:"
echo "  1. Edit API keys:  nano ~/.env_secrets"
echo "  2. Reload shell:   source ~/.bashrc"
echo "  3. Login Claude:   claude login"

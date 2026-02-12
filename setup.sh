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

if ! grep -q '\.local/bin' "$SHELL_RC" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "[OK] Added ~/.local/bin to PATH in $SHELL_RC"
fi

# 5. Cleanup cloned repo
rm -rf "$REPO_DIR"

# 6. Install missing dependencies
echo ""
echo "=== Installing Dependencies ==="

PKG_INSTALL=""
if command -v apt-get &>/dev/null; then
    apt-get update -qq >/dev/null 2>&1
    PKG_INSTALL="apt-get install -y -qq"
elif command -v yum &>/dev/null; then
    PKG_INSTALL="yum install -y -q"
elif command -v apk &>/dev/null; then
    PKG_INSTALL="apk add --quiet"
fi

for pkg in jq; do
    if ! command -v "$pkg" &>/dev/null; then
        if [ -n "$PKG_INSTALL" ]; then
            $PKG_INSTALL "$pkg" >/dev/null 2>&1 && echo "[OK] $pkg installed" || echo "[!!] $pkg install failed"
        else
            echo "[!!] $pkg - MISSING (install manually)"
        fi
    else
        echo "[OK] $pkg"
    fi
done

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
echo "Next: paste the following with your keys filled in:"
echo ""
echo '  cat > ~/.env_secrets << '\''EOF'\'''
echo '  export GITHUB_TOKEN="<your-token>"'
echo '  export BRAVE_API_KEY="<your-key>"'
echo '  export LINEAR_API_KEY="<your-key>"'
echo '  EOF'
echo ""
echo "Then:"
echo "  source ~/.bashrc"
echo "  claude login"

#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Claude Code Config Installer ==="

# 1. Copy .claude/ directory
mkdir -p "$HOME/.claude/commands" "$HOME/.claude/hooks"

cp "$SCRIPT_DIR/.claude/settings.json" "$HOME/.claude/settings.json"
cp "$SCRIPT_DIR/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
cp "$SCRIPT_DIR/.claude/commands/"*.md "$HOME/.claude/commands/"
cp "$SCRIPT_DIR/.claude/hooks/"*.sh "$HOME/.claude/hooks/"
chmod +x "$HOME/.claude/hooks/"*.sh

echo "[OK] ~/.claude/ config copied"

# 2. Set up .env_secrets
if [ ! -f "$HOME/.env_secrets" ]; then
    cp "$SCRIPT_DIR/.env_secrets.example" "$HOME/.env_secrets"
    echo "[!!] ~/.env_secrets created from template - fill in your API keys"
else
    echo "[OK] ~/.env_secrets already exists, skipping"
fi

# 3. Ensure .env_secrets is sourced in shell
SHELL_RC="$HOME/.zshrc"
[ ! -f "$SHELL_RC" ] && SHELL_RC="$HOME/.bashrc"

if ! grep -q 'source.*\.env_secrets' "$SHELL_RC" 2>/dev/null; then
    echo 'source ~/.env_secrets' >> "$SHELL_RC"
    echo "[OK] Added 'source ~/.env_secrets' to $SHELL_RC"
else
    echo "[OK] .env_secrets already sourced in $SHELL_RC"
fi

# 4. Check dependencies
echo ""
echo "=== Dependency Check ==="
for cmd in node npx jq; do
    if command -v "$cmd" &>/dev/null; then
        echo "[OK] $cmd"
    else
        echo "[!!] $cmd not found - install required"
    fi
done

if command -v docker &>/dev/null; then
    echo "[OK] docker (for GitHub MCP)"
else
    echo "[--] docker not found (optional, for GitHub MCP)"
fi

echo ""
echo "=== Done ==="
echo "Next: run 'claude login' to authenticate (SSH port forwarding for remote)"

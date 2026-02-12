# Claude Code Config

Portable Claude Code configuration for quick setup on remote environments.

## Quick Setup

```bash
git clone git@github.com:gkswns0531/claude-config.git
cd claude-config
./install.sh
# Edit ~/.env_secrets with your API keys
source ~/.zshrc
claude login  # SSH port forwarding: ssh -L 8080:localhost:8080 remote
```

## What's Included

| File | Purpose |
|------|---------|
| `.claude/settings.json` | Permissions, plugins, hooks |
| `.claude/CLAUDE.md` | Global instructions |
| `.claude/commands/*.md` | 9 custom slash commands |
| `.claude/hooks/*.sh` | Dangerous command blocker |
| `.env_secrets.example` | API key template |
| `install.sh` | Automated installer |

## API Keys Required

Fill in `~/.env_secrets` after install:

- `OPENAI_API_KEY`
- `HF_TOKEN`
- `GITHUB_TOKEN` / `GITHUB_PERSONAL_ACCESS_TOKEN`
- `BRAVE_API_KEY`
- `LINEAR_API_KEY`

## MCP Servers

Configured via `claude mcp add` or auto-inherited from shell env:

- **memory** - `@modelcontextprotocol/server-memory`
- **mermaid** - `claude-mermaid`
- **brave-search** - `@modelcontextprotocol/server-brave-search` (needs `BRAVE_API_KEY`)
- **github** - Docker-based GitHub MCP (needs `GITHUB_PERSONAL_ACCESS_TOKEN` + Docker)

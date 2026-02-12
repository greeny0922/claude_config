# Claude Code Config

Portable Claude Code configuration for quick setup on ephemeral remote servers.

## Setup

```bash
# 1. Claude Code 설치
curl -fsSL https://claude.ai/install.sh | bash

# 2. 설정 원라인 세팅 (T에 GitHub PAT 넣기)
T=<GITHUB_TOKEN> && bash <(curl -sL -H "Authorization: Bearer $T" -H "Accept: application/vnd.github.v3.raw" https://api.github.com/repos/gkswns0531/claude-config/contents/setup.sh) "$T"

# 3. API 키 입력 & 인증
vi ~/.env_secrets
source ~/.env_secrets
claude login
```

## Dependencies

```bash
# jq (hooks에서 필요)
apt-get update && apt-get install -y jq

# Node.js (MCP 서버에서 필요: memory, mermaid, brave-search)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc && nvm install --lts
```

## What's Included

| File | Purpose |
|------|---------|
| `.claude/settings.json` | Permissions, plugins, hooks |
| `.claude/CLAUDE.md` | Global dev standards |
| `.claude/commands/*.md` | 9 custom slash commands |
| `.claude/hooks/*.sh` | Dangerous command blocker |
| `.env_secrets.example` | API key template |
| `setup.sh` | Remote one-liner installer |

## API Keys Required (`~/.env_secrets`)

- `GITHUB_TOKEN` — GitHub MCP, gh CLI
- `BRAVE_API_KEY` — Brave Search MCP
- `LINEAR_API_KEY` — Linear 커맨드

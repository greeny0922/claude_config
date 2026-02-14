# Claude Code Config

Portable Claude Code configuration for quick setup on ephemeral remote servers.

## Setup

```bash
# 1. Claude Code 설치
curl -fsSL https://claude.ai/install.sh | bash

# 2. 설정 세팅 (T에 GitHub PAT 넣기)
T=<GITHUB_TOKEN> && bash <(curl -sL -H "Authorization: Bearer $T" -H "Accept: application/vnd.github.v3.raw" https://api.github.com/repos/greeny0922/claude_config/contents/setup.sh) "$T"

# 3. API 키 입력 (값 채워서 통째로 복붙)
cat > ~/.env_secrets << 'EOF'
export GITHUB_TOKEN=""
export HF_TOKEN=""
export BRAVE_API_KEY=""
export LINEAR_API_KEY=""
EOF

# 4. 환경변수 로드 & 인증
source ~/.bashrc
claude login
```

## What's Included

| File | Purpose |
|------|---------|
| `.claude/settings.json` | Permissions, plugins, hooks |
| `.claude/CLAUDE.md` | Global dev standards |
| `.claude/commands/*.md` | 9 custom slash commands |
| `.claude/hooks/*.sh` | Dangerous command blocker |
| `setup.sh` | Remote one-liner installer (jq, Node.js 자동 설치) |

## API Keys

- `GITHUB_TOKEN` — GitHub MCP, gh CLI
- `HF_TOKEN` — HuggingFace
- `BRAVE_API_KEY` — Brave Search MCP
- `LINEAR_API_KEY` — Linear 커맨드

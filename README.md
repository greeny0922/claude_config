# Claude Code Config

Portable Claude Code configuration for quick setup on ephemeral remote servers.

## 0. Install Claude Code

```bash
# Node.js 18+ 필요
npm install -g @anthropic-ai/claude-code@latest
```

Node.js가 없으면:
```bash
# nvm으로 설치
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts
npm install -g @anthropic-ai/claude-code@latest
```

## 1. One-liner Setup (Remote/Ephemeral)

```bash
# GITHUB_TOKEN 하나만 알면 끝
bash <(curl -sL https://raw.githubusercontent.com/gkswns0531/claude-config/master/setup.sh) <GITHUB_TOKEN>
```

SSH 키 필요 없음. HTTPS + PAT로 clone 후 자동 설치 & 정리.

## 2. After Install

```bash
vi ~/.env_secrets        # API 키 입력
source ~/.env_secrets    # 환경변수 로드
claude login             # Claude 인증 (SSH forwarding: ssh -L 8080:localhost:8080 remote)
```

## Manual Setup (Local)

```bash
git clone git@github.com:gkswns0531/claude-config.git
cd claude-config && ./install.sh
```

## What's Included

| File | Purpose |
|------|---------|
| `.claude/settings.json` | Permissions, plugins, hooks |
| `.claude/CLAUDE.md` | Global dev standards |
| `.claude/commands/*.md` | 9 custom slash commands |
| `.claude/hooks/*.sh` | Dangerous command blocker |
| `.env_secrets.example` | API key template |
| `install.sh` | Local installer |
| `setup.sh` | Remote one-liner installer |

## API Keys Required (`~/.env_secrets`)

- `OPENAI_API_KEY`
- `HF_TOKEN`
- `GITHUB_TOKEN` / `GITHUB_PERSONAL_ACCESS_TOKEN`
- `BRAVE_API_KEY`
- `LINEAR_API_KEY`

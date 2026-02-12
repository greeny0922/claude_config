# Claude Code Config

Portable Claude Code configuration for quick setup on ephemeral remote servers.

## One-liner Setup (Remote/Ephemeral)

```bash
# GITHUB_TOKEN만 알면 끝
bash <(curl -sL https://raw.githubusercontent.com/gkswns0531/claude-config/master/setup.sh) <GITHUB_TOKEN>
```

SSH 키 필요 없음. HTTPS + PAT로 clone 후 자동 설치 & 정리.

## Manual Setup (Local)

```bash
git clone git@github.com:gkswns0531/claude-config.git
cd claude-config && ./install.sh
```

## After Install

```bash
vi ~/.env_secrets        # API 키 입력
source ~/.env_secrets    # 환경변수 로드
claude login             # Claude 인증 (SSH forwarding: ssh -L 8080:localhost:8080 remote)
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

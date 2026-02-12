# Claude Code Config

Portable Claude Code configuration for quick setup on ephemeral remote servers.

## 0. Install Claude Code

```bash
# Native install (권장, 자동 업데이트 지원)
curl -fsSL https://claude.ai/install.sh | bash
```

## 1. One-liner Setup (Remote/Ephemeral)

```bash
# T=토큰 한번만 설정하면 끝
T=<GITHUB_TOKEN>
bash <(curl -sL -H "Authorization: token $T" -H "Accept: application/vnd.github.v3.raw" https://api.github.com/repos/gkswns0531/claude-config/contents/setup.sh) "$T"
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

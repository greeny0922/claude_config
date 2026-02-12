# Git Commit

Create a well-structured commit message following Conventional Commits specification.

## Arguments
$ARGUMENTS

## Steps

### 1. Analyze Changes
```bash
git status
git diff --staged
git diff  # if nothing staged
```

### 2. Determine Commit Type

| Type | Description | Emoji |
|------|-------------|-------|
| `feat` | New feature | ✨ |
| `fix` | Bug fix | 🐛 |
| `docs` | Documentation | 📝 |
| `style` | Formatting (no code change) | 💄 |
| `refactor` | Code refactoring | ♻️ |
| `perf` | Performance improvement | ⚡ |
| `test` | Adding tests | ✅ |
| `chore` | Maintenance | 🔧 |
| `ci` | CI/CD changes | 👷 |

### 3. Review Recent Commits (for style consistency)
```bash
git log --oneline -10
```

### 4. Generate Commit Message

Format:
```
<type>(<scope>): <subject>

<body>

<footer>
```

Rules:
- Subject: imperative mood, no period, under 50 chars
- Body: explain "what" and "why", wrap at 72 chars
- Footer: reference issues (e.g., `Closes #123`)

### 5. Stage and Commit
```bash
git add <files>  # or git add -A if appropriate
git commit -m "message"
```

## Options
- If `$ARGUMENTS` contains "amend": use `git commit --amend`
- If `$ARGUMENTS` contains "wip": prefix with `wip:`

## Precautions
- Never commit sensitive files (.env, credentials)
- Review staged files before committing
- Don't commit unrelated changes together

## Language
**Always respond in Korean when explaining to the user.**

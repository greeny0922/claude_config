# Branch Creation

Create a new branch and checkout.

## Arguments
$ARGUMENTS

## Branch Naming Convention

### Format
```
<type>/<short-description>
```

### Types
| Type | Purpose | Example |
|------|---------|---------|
| `feature/` | New feature | `feature/user-login` |
| `fix/` | Bug fix | `fix/null-pointer-error` |
| `refactor/` | Refactoring | `refactor/auth-module` |
| `docs/` | Documentation | `docs/api-readme` |
| `test/` | Add tests | `test/unit-auth` |
| `chore/` | Miscellaneous | `chore/update-deps` |

### Rules
- Use lowercase only
- Separate words with hyphens (`-`)
- Keep it concise (3-4 words max)
- Can include issue number: `feature/123-user-login`

## Steps

### 1. Check Current State
```bash
git status
git branch --show-current
```

### 2. Determine Branch Name
- Analyze user's description or $ARGUMENTS
- Select appropriate type

### 3. Create Branch
```bash
git checkout -b <branch-name>
```

### 4. Confirmation
- Output created branch name
- Guide next steps (work → /pr)

## Precautions
- Warn if there are uncommitted changes
- Ask for confirmation if branch name already exists

## Language
**Always respond in Korean when explaining to the user.**

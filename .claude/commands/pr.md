# Pull Request Creation

Analyze changes in the current branch and create a PR.

## Arguments
$ARGUMENTS

## Steps

### 1. Check Current State
```bash
git status
git branch --show-current
git log main..HEAD --oneline  # or master
```

### 2. Analyze Changes
- Which files were changed
- Content of each commit
- Review the complete diff

### 3. Write PR Information

#### Title Rules
- Under 70 characters
- Format: `[type] concise description`
- Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`

#### Body Template
```markdown
## Summary
- Summary of changes (1-3 lines)

## Changes
- List of main changed files/features

## Test Plan
- [ ] Test item 1
- [ ] Test item 2

## Related Issues
- closes #issue-number (if any)
```

### 4. Create PR
```bash
gh pr create --title "title" --body "body"
```

### 5. Output Result
- Provide PR URL
- Guide for adding reviewers (if needed)

## Precautions
- Push unpushed commits first
- Do not run on main/master branch
- Requires gh authentication (gh auth login)

## Language
**Always respond in Korean when explaining to the user.**

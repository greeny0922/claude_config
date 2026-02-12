# Bug Fix Assistant

Systematically analyze and fix errors or bugs.

## Target
$ARGUMENTS

## Input Types
- Error message / Stack trace
- Bug description
- Issue number (e.g., #123)
- File path with problematic code

## Steps

### Phase 1: Problem Analysis

#### 1.1 Gather Information
- Full error message and stack trace
- Steps to reproduce
- Expected vs actual behavior
- Environment details (if relevant)

#### 1.2 Locate the Source
- Identify the file and line number
- Trace the call stack
- Find related code paths

#### 1.3 Root Cause Analysis
- What is actually failing?
- Why is it failing?
- When did it start failing? (if known)

### Phase 2: Solution Development

#### 2.1 Identify Fix Options
- List possible solutions
- Evaluate trade-offs
- Consider side effects

#### 2.2 Implement Fix
- Make minimal necessary changes
- Preserve existing behavior where appropriate
- Add defensive checks if needed

#### 2.3 Verify Fix
- Test the specific scenario
- Check for regressions
- Verify edge cases

### Phase 3: Documentation

#### 3.1 Explain the Fix
- What was the root cause
- What changes were made
- Why this approach was chosen

## Output Format

```markdown
## Problem
[Brief description of the issue]

## Root Cause
[Explanation of why this happened]

## Solution
[Description of the fix]

## Changes Made
| File | Change |
|------|--------|

## Verification
- [ ] Original issue resolved
- [ ] No regressions introduced
- [ ] Edge cases handled
```

## Precautions
- Don't make unrelated changes
- Preserve backward compatibility when possible
- Add tests for the bug if practical

## Language
**Always respond in Korean when explaining to the user.**

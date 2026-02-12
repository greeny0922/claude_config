#!/bin/bash
# Claude Code - 위험 명령어 차단 Hook
# 입력: JSON (stdin) - {"tool_input": {"command": "..."}}

# stdin에서 명령어 추출
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# 명령어가 없으면 통과
if [ -z "$COMMAND" ]; then
    exit 0
fi

# 위험 패턴 목록
DANGEROUS_PATTERNS=(
    "rm -rf /"
    "rm -rf ~"
    "rm -rf \*"
    "rm -rf /\*"
    "git push.*--force.*main"
    "git push.*--force.*master"
    "git push.*-f.*main"
    "git push.*-f.*master"
    "git reset --hard"
    "chmod -R 777"
    "chmod 777 /"
    "dd if=/dev"
    "> /dev/sda"
    "mkfs\."
    ":(){:|:&};:"
)

# 각 패턴 검사
for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qE "$pattern"; then
        echo "BLOCKED: 위험한 명령어가 감지되었습니다: $pattern" >&2
        exit 2  # exit 2 = 차단
    fi
done

# 통과
exit 0

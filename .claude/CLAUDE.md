# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) across all projects.

## Development Standards

- **Clarity over cleverness** — write code that a junior engineer can read, understand, and maintain without tribal knowledge. Prefer explicit intent, straightforward control flow, and self-evident naming over compact or abstract constructs.
- **Type hints mandatory** for all new code (Python 3.10+ syntax)
- **PEP 8** compliance with 120-character line length
- **Small PR sizes** mandatory for human review

## Testing

- **Framework**: pytest
- **Test Discovery**: `test_*.py` pattern
- **Requirements**: Type hints mandatory for test methods (`-> None`)

## Security

- Never commit secrets or API keys
- Use environment variables for configuration

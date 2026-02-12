# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) across all projects.

## Development Standards

- **Type hints mandatory** for all new code (Python 3.10+ syntax)
- **PEP 8** compliance with 120-character line length
- **Domain isolation** - work on one domain at a time when working with DDD projects
- **Repository pattern** for all data access
- **Small PR sizes** mandatory for human review

## Testing

- **Framework**: pytest with Django integration where applicable
- **Test Discovery**: `test_*.py` pattern
- **Requirements**: Type hints mandatory for test methods (`-> None`)

## Security and Best Practices

- Never commit secrets or API keys
- Use environment variables for configuration
- Follow Django security best practices where applicable
- Maintain domain boundaries and dependency contracts

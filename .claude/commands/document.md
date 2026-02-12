# Implementation Analysis

Analyze how a specific concept, feature, or component is implemented in the codebase.

## Target
$ARGUMENTS

## Output Location
```
~/.claude/docs/YYYY-MM-DD-<topic-slug>.md
```

## Example Questions
- "How is the solar model implemented?"
- "Where is the attention mechanism handled?"
- "How does the caching logic work?"
- "What's the architecture of the scheduler?"

## Steps

### 1. Keyword Search
- Search for related files/classes/functions
- Trace import relationships
- Identify entry points

### 2. Core Implementation Analysis
- Find the main entry point
- Identify key classes/functions
- Trace data flow

### 3. Architecture Analysis
- Component relationships
- Dependency structure
- Extension points

### 4. Deep Dive
- Core algorithms
- Important optimizations
- Special cases and edge handling

## Output Format

```markdown
## Overview
[One paragraph summary]

## Key Files
| File | Role |
|------|------|

## Implementation Details

### Entry Point
- ...

### Key Classes/Functions
- `ClassName`: description
- `function_name()`: description

### Data Flow
1. ...
2. ...

## Diagram (if needed)
[Use Mermaid syntax]

## Notes
- Related documentation
- Known limitations
- Important comments in code
```

## Language
**Always respond in Korean when explaining to the user.**

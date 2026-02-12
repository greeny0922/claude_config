# Test Generator

Generate comprehensive test cases for the specified code.

## Target
$ARGUMENTS

## Test Types

### Unit Tests
- Individual functions/methods
- Isolated from dependencies (use mocks)
- Fast execution

### Integration Tests
- Multiple components together
- Database, API interactions
- Real dependencies (or realistic fakes)

### Edge Cases
- Boundary values
- Empty/null inputs
- Error conditions
- Concurrent access (if applicable)

## Steps

### 1. Analyze Target Code
- Identify public interfaces
- Find dependencies to mock
- Understand business logic
- Note edge cases and error paths

### 2. Determine Test Framework
- Python: `pytest` (preferred), `unittest`
- JavaScript/TypeScript: `jest`, `vitest`
- Go: built-in `testing`
- Match existing project conventions

### 3. Generate Test Cases

#### Test Structure (AAA Pattern)
```
Arrange - Set up test data and mocks
Act     - Execute the code under test
Assert  - Verify the results
```

#### Naming Convention
```
test_<function>_<scenario>_<expected_result>
# Example: test_calculate_total_with_discount_returns_reduced_price
```

### 4. Coverage Targets
- Happy path (normal operation)
- Error handling
- Boundary conditions
- Edge cases

## Output Format

```markdown
## Test Plan for `<target>`

### Test Cases
| # | Scenario | Input | Expected | Priority |
|---|----------|-------|----------|----------|

### Generated Tests
[Code block with actual test code]

### Mocking Strategy
- [What needs to be mocked and why]

### Coverage Notes
- [Areas covered]
- [Areas that need manual testing]
```

## Framework-Specific Notes

### pytest (Python)
- Use fixtures for setup/teardown
- Use `@pytest.mark.parametrize` for multiple inputs
- Use `pytest.raises` for exception testing

### Jest (JavaScript)
- Use `describe` blocks for grouping
- Use `beforeEach`/`afterEach` for setup
- Use `jest.mock()` for mocking

## Precautions
- Tests should be deterministic
- Avoid testing implementation details
- Keep tests independent of each other
- Don't test external libraries

## Language
**Always respond in Korean when explaining to the user.**

# Research Report Generator

Create a comprehensive, well-structured research report on a given concept or topic.

## Target
$ARGUMENTS

## Output Location
```
~/.claude/research/YYYY-MM-DD-<topic-slug>.md
```

## Report Philosophy

This is NOT a code analysis. This is a **conceptual research report** that explains ideas, techniques, or technologies in a scholarly yet accessible manner.

### Implicit Narrative Flow (Do NOT use as section titles)

Every report should implicitly follow this logical progression:

1. **Motivation** - Why does this matter? What problem exists?
2. **Approach** - How do people/systems address this?
3. **Challenge** - What makes this difficult?
4. **Solution** - What are the key insights or techniques?
5. **Result** - What outcomes or impacts does this have?
6. **Limitation** - What are the boundaries or open questions?

The section names should be **topic-specific and intuitive**, not these six words directly.

## Report Structure

```markdown
# [Topic Title]

> [One compelling sentence that captures the essence]

## Table of Contents

## 1. Introduction
### 1.1 Background
### 1.2 Motivation
### 1.3 Scope of This Report

## 2. [Core Concept Section]
### 2.1 ...
### 2.2 ...

## 3. [Technical Deep Dive / How It Works]
### 3.1 ...
### 3.2 ...

## 4. [Challenges & Solutions]
### 4.1 ...
### 4.2 ...

## 5. [Applications / Use Cases / Results]
### 5.1 ...

## 6. [Limitations & Future Directions]
### 6.1 Current Limitations
### 6.2 Open Research Questions

## 7. Conclusion

## References
```

## Writing Guidelines

### Style
- **Scholarly yet accessible**: Rigorous but not dry
- **Concrete examples**: Abstract concepts need tangible illustrations
- **Visual aids**: Use diagrams (Mermaid), tables, code snippets where helpful
- **Progressive depth**: Start simple, build complexity

### Hook Sentences (IMPORTANT)

Each major section should end with **1-2 memorable sentences** that:
- Crystallize the key insight
- Create an "aha moment"
- Bridge to the next section or leave a lasting impression

Examples of good hooks:
- "In essence, PagedAttention treats GPU memory the way operating systems treat RAM—and that single insight unlocked 24x higher throughput."
- "The elegance of transformers lies not in what they compute, but in what they allow to be computed in parallel."
- "Perhaps the most counterintuitive finding: making the model smaller sometimes makes it smarter."

### Formatting
- Use **bold** for key terms on first introduction
- Use `code formatting` for technical terms, parameters, commands
- Use > blockquotes for important insights or quotes
- Use tables for comparisons
- Use Mermaid diagrams for architectures and flows

## Research Process

### 1. Information Gathering
- Search the web for authoritative sources
- Find seminal papers, blog posts, documentation
- Identify key figures and their contributions

### 2. Synthesis
- Connect disparate ideas
- Identify the narrative thread
- Find the "story" in the concept

### 3. Writing
- Draft with clarity as the primary goal
- Revise for flow and impact
- Add hooks and memorable phrases

### 4. Review
- Check logical consistency
- Verify technical accuracy
- Ensure accessibility to target audience

## Example Topics
- "PagedAttention and memory-efficient inference"
- "Mixture of Experts (MoE) architecture"
- "Speculative decoding for LLM acceleration"
- "RLHF and preference learning"
- "Quantization techniques for LLMs"

## Precautions
- Cite sources when making specific claims
- Distinguish between established facts and emerging research
- Acknowledge uncertainty where it exists
- Avoid hype; maintain scholarly objectivity

## Language
**The report MUST be written in Korean (한국어).**
**Technical terms can remain in English where appropriate (e.g., PagedAttention, Transformer).**

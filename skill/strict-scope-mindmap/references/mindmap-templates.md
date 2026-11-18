# Execution Mind Map & Boundary Gate Templates

## 1. Standard Execution Mind Map Template

```text
[Objective]: <Single imperative sentence stating the core outcome + runtime role in this project>
├── Direct Requirements
│   └── <Explicit user requirements>
├── Holistic Must-Haves (Inside Target Scope + Long-Term Future Safety)
│   ├── <Owning boundary change>
│   └── <Cohesive consumer / layout / state / memory-safety adjustment>
├── Target Scope (Allowed Files & Symbols)
│   └── <path/to/file.ext#SymbolName>
├── Hardest Test Environment (Adaptive Loop on Target Scope)
│   ├── <Selected Plugin & Runner from plugins/>
│   ├── <Scenario Matrix: 20-100+ cases covering functional, boundary, malformed, concurrency, future scale>
│   └── <Adaptive Gate: Stop at Pass 2 if 0 defects & 0 future risk; else fix & run Pass 3+>
└── Hard Boundary (Do Not Read or Touch)
    └── <Adjacent modules, sibling routes, unrelated configs>
```

## 2. Fail-Closed Boundary Gate Template

```markdown
**Scope Boundary Check**
- **Current Target (Area A)**: `<file or symbol being worked on>`
- **Out-of-Scope Dependency (Area B)**: `<external file or module needed>`
- **Why It Is Needed**: <1-2 sentences explaining the concrete contract mismatch or failure if Area B is not read/updated>
- **Proposed Minimal Action**: <Read-only inspection | Specific 1-function update in Area B>

Should I proceed with inspecting/updating `<Area B>`, or keep the change strictly inside `<Area A>`?
```

## 3. Mandatory Closing Line Template

At the very end of every coding/testing response in the terminal or chat box, include:

```markdown
Bạn có muốn tôi kiểm luôn các file còn lại không?
```

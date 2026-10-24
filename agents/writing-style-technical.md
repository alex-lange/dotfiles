# Writing Style: Technical

Rules for engineering writing: PR descriptions, investigations, decision proposals,
implementation handoffs, status updates, design docs, review replies, and code comments.

The general rules in `writing-style.md` apply here too. This file adds what's specific to technical writing.

## Structure by purpose

Use the requested format or repository template when provided. Otherwise choose
the default below. These describe reading order, not mandatory headings or minimum
lengths. Scale the background to the audience's familiarity and the task.

| Document | Reader's task | Default structure |
|---|---|---|
| PR description | Understand and review a change | What changed, why it was needed, and relevant behavior or risks. Include only background needed to review the diff; link broader investigations. A small change may need only a few sentences. |
| Investigation report | Understand a problem and evaluate findings | Problem and necessary system context, findings and their relationship, proposed action, and uncertainty. Introduce unfamiliar operations and incidents before evaluating them. |
| Decision proposal | Choose between options | Decision needed, relevant constraints, options and tradeoffs, and recommendation with rationale when requested. |
| Implementation handoff | Continue work without repeating discovery | Objective, current state, scope, exact changes, validation, and unresolved decisions. |
| Status update | Understand progress and whether action is needed | Progress, blockers, and next action. Reuse established context rather than repeating the project introduction. |

### Investigation reports

- **Make the main explanation self-contained.** A reader should understand the problem, relevant operation, findings, and proposed action without opening citations. Put exhaustive inventories, queries, and implementation details in supporting sections or files.
- **Explain relationships between findings.** Distinguish observed incidents, findings from code inspection, and proposed changes. State when a finding has not been shown to cause an incident.
- **Check the opening from the reader's perspective.** Read it without the source notes. Every system or incident needed to understand the proposal should be introduced before the explanation depends on it. Preserve evidence limits alongside the claims they qualify.

### Design docs

- **Use a diagram or concrete example** when it explains the behavior more clearly than prose. Show the before/after or data flow alongside the relevant explanation.
- **Reference details already covered.** If scope is established in one section, reference it from the implementation plan rather than restating it.
- **Mark open questions and TODOs explicitly.** Use `**TODO:**` inline for things that need investigation.
- **Keep unfinished sections visible in requested drafts.** Mark them `[WIP]` or `[IN PROGRESS]`, with the heading or a short statement of what remains unresolved. Leave unknown details explicit rather than filling them with plausible text.

## Evidence and uncertainty
- **Don't pair a hedge with an absolute claim.** If you're unsure, let the whole sentence say so.
  - No: `As far as I can tell, we can't preserve this behavior without changing access control.`
  - Yes: `I'm not sure we can preserve this behavior without changing access control.`
- **Say what you haven't checked.** `We haven't tested that approach yet, so it might not work.`
- **Hedge your confidence out loud.** "as far as I can tell", "it seems like", "I think", "probably", "not clear if we'll need to". Mark judgment as judgment instead of flattening everything to one confident tone. Facts about what exists today still get declarative voice.
- **Report missing data as missing.** A failed query, an absent data series, or an unsearched source is a gap, not a zero or a negative result.
- **Keep each claim's type.** A recommendation says "should", an inference says how it was inferred, and a proposal stays separate from a decision. Current practice gets declarative voice only when it was observed.
- **Vague placeholders beat invented precision.** "some kind of deduplication", "TBD", "or something" are fine when the detail isn't settled. Don't manufacture a specific number, name, or mechanism to fill a gap.

## Revising documents

These apply when editing an existing document, including fixing review findings.

- **Change wording and structure, not claims.** Keep every number, ID, link, date, qualifier that carries evidence, attribution, and caveat. If a fact moves, confirm it exists in its new place.
- **Keep the document cohesive.** Put new findings in the sections they belong to, and date the facts rather than the sections. The document describes the subject, not its own edit history or the tools used to research it.
- **State changing status once.** Give status that will change, such as PR state or the agreed next step, one dated, canonical location. Link to it from other sections and documents.
- **Keep inbound links working.** Before renaming or removing a heading, find links to it and update them.
- **Use one name for each thing.** When a system, measurement, or decision has several names across documents, pick one and use it everywhere.

## Comparing options
- **Match the comparison to the request.** For a neutral comparison, present options under their own headings or in a table, with any tentative preference noted briefly. When asked to recommend, identify the preferred option and explain it using the same criteria applied to the alternatives.
- **When using Pros/Cons, group them:**
  ```
  - **Pros**:
    - **Bold title.** Description sentence.
    - **Another pro.** More detail.
  - **Cons**:
    - **Bold title.** Description sentence.
  ```
  Not: `- **Pro**: description` / `- **Con**: description`

- **In review replies and messages, use the same short fields for every option instead of Pros/Cons.** Pick the fields the reader needs to decide, such as what changes, who's affected, and the remaining issue. Use the same fields in the same order for every option. Omit a field rather than pad it.
  ```markdown
  ### 3. Change the permission check (this version)

  - **Access rules:** expands who can pass the check.
  - **Who gets the error:** callers who lack the required permission.
  ```
- **When options are earlier versions of the same work, label them.** Use `(first version)`, `(second version)`, or `(this version)` so the reader can match each option to what they've reviewed.
- **Show the concrete result of an issue inline.** `A caller could distinguish an existing resource they can't read (403) from a missing one (404).`

## Replying to review comments

- **Acknowledge the reviewer's specific point.** Name the point rather than giving generic praise.
  - No: `Thanks, that's a good point.`
  - Yes: `Thanks! Good point that ownership doesn't necessarily imply access.`
- **Don't state what the reviewer thinks or wants.** If you're inferring their concern, ask them to confirm it.
  - No: `This expands access, which is the concern you raised.`
  - Yes: `This expands access. Is that your concern?`
- **Own earlier decisions plainly, including ones that look wrong now.** Explain why you made the choice, then say what you think of it now. Don't defend it.
- **Refer to things by names the reviewer knows.** Use the PR, method, or endpoint instead of labels invented while working.
- **Credit where options or findings came from.** `These are the options I (and Copilot) have looked at.`
- **Say when a list isn't complete.** `There are probably more options.`
- **End with the questions you need answered, as a list.** Omit this when no answer is needed. Don't end with your own preference unless the reviewer asked for one.

## Code comments

Everything in the general guide applies. These are the failure modes specific to comments.

- **A comment answers "what breaks if I change this".** Not what the line does, not why we chose it over the alternative.
- **Say what the code can't, not why you chose it.** Decision rationale belongs in the commit message or PR description, where reviewers look for it and where it doesn't go stale in the file. A comment that argues for a choice is a commit message in the wrong place. Keep the pointer, drop the argument.
  - No: `// Duplicated from image-workers rather than extracted: it is ~15 lines, and pulling it into a shared lib would mean editing that app in this change. Worth extracting if a third app needs it.`
  - Yes: `// Copied from image-workers. If a third app needs it we can extract it to a shared lib.`
- **Don't explain the language, the framework, or a well-known API.** If a reader of this file already knows the tool, the comment is noise.
  - No: `// Activity methods cannot be suspend, hence runBlocking, matching ExistingActivities.`
  - No: `// Nullable, so it may be absent.`
- **No banner comments.** All-caps headers, numbered prerequisite lists, and separator lines read as documentation that escaped into the wrong file. State the facts in two or three lines. A 17-line header on a config file is a doc nobody will find.
- **Don't restate an adjacent comment.** Same rule as cutting trailing restaters, applied to neighbouring lines.
  - No: `# Keep between X and Y` immediately followed by `# Must be less than X`
- **Comment the surprise, not the obvious.** The best comments explain a non-obvious constraint, a deliberate asymmetry, or a trap for the next reader: why one call is left unrecovered while the one below it isn't, or why a field must never be used for ordering. Those earn their lines. Narrating the happy path does not.
- **Length should match the file's neighbours.** A paragraph above a two-line function is too long.

## Linking to source code
- **Link `file:line` references to GitHub, pinned to a commit SHA.** Don't link to `main`/`HEAD` (line numbers drift). Format: `` [`File.kt:118-139`](https://github.com/<org>/<repo>/blob/<sha>/<path>#L118-L139) ``.
- Get the SHA from the local checkout (`git -C ../<repo> rev-parse HEAD`) and confirm the cited files are clean (`git status`) so line numbers match the linked commit.

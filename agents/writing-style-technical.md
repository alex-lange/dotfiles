# Writing Style: Technical

Rules for engineering writing: code comments, design docs, PR descriptions, architecture notes, incident write-ups.

The general rules in `writing-style.md` apply here too. This file adds what's specific to technical writing.

## Terminology
- **Reserve `--` for SQL comments and CLI flags.** Never as a parenthetical aside.

## Plain words, applied to engineering prose
Worked examples of the general plain-words rule:
- "Get the query plan" not "Grab the query plan".
- "Where sampling applies" not "where sampling bites".
- "the schemas are 10-100 MB" not "the schemas run 10-100 MB".
- "payloads in the response" not "payloads on the wire".
- "a day of running in prod" not "a day of prod bake".
- "the database call takes the most time" not "the database call is the request".

## Uncertainty
- **Don't pair a hedge with an absolute claim.** If you're unsure, let the whole sentence say so.
  - No: `As far as I can tell, we can't preserve this behavior without changing access control.`
  - Yes: `I'm not sure we can preserve this behavior without changing access control.`
- **Say what you haven't checked.** `We haven't tested that approach yet, so it might not work.`
- **Hedge your confidence out loud.** "as far as I can tell", "it seems like", "I think", "probably", "not clear if we'll need to". Mark judgment as judgment instead of flattening everything to one confident tone. Facts about what exists today still get declarative voice.
- **Vague placeholders beat invented precision.** "some kind of deduplication", "TBD", "or something" are fine when the detail isn't settled. Don't manufacture a specific number, name, or mechanism to fill a gap.

## Comparing options
- **Options as headings, not as a recommendation.** Present options neutrally. If there's a lean, put a short note in the comparison section, not a separate "Recommendation" section that argues for one side.
- **Pros/Cons in grouped format:**
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
- **End with the questions you need answered, as a list.** Don't end with your own preference unless the reviewer asked for one. The conversation guide's recommendation rule applies to replies to the user, not replies to colleagues.

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

## Design doc structure
- **Lead sections with a diagram or concrete example** when possible. Show the before/after or the data flow first, then explain in text.
- **Don't repeat the same information in multiple sections.** If something is covered in the scoping section, reference it from the implementation plan instead of restating it.
- **Mark open questions and TODOs explicitly.** Use `**TODO:**` inline for things that need investigation.
- **Ship the skeleton. Don't hide unfinished sections.** Mark them `[WIP]` or `[IN PROGRESS]` and leave the heading, the empty table, or the one-line stub in place. A visible hole is more useful than a section that quietly isn't there. Don't fill a gap with plausible text.

## Linking to source code
- **Link `file:line` references to GitHub, pinned to a commit SHA.** Don't link to `main`/`HEAD` (line numbers drift). Format: `` [`File.kt:118-139`](https://github.com/<org>/<repo>/blob/<sha>/<path>#L118-L139) ``.
- Get the SHA from the local checkout (`git -C ../<repo> rev-parse HEAD`) and confirm the cited files are clean (`git status`) so line numbers match the linked commit.
- Note the pinned commit(s) once near the top of the doc so readers know the links are point-in-time.

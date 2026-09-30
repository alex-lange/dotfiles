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

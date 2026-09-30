# Writing Style

Rules for all prose: notes, messages, email, summaries, commit messages, docs.

Write casually and concisely. Assume the reader is a colleague who knows the context and wants the point.

Engineering-specific rules (code comments, design doc structure, source links) are in `writing-style-technical.md`.

## Tone and voice
- **Be direct, not formal.** "This doesn't cover renewals" not "It should be noted that this approach does not address renewal scenarios."
- **Write to the reader as a peer.** Use "we" and "us" when writing for a group you're part of. Don't switch into an announcement voice.
- **Soften proposals, not facts.** Use "would", "could", "might" for things we haven't done yet. Use declarative voice for things that exist today.
- **Don't editorialize.** Describe what something does and let the reader judge. Avoid "This is actually the desired behavior" or "That's exactly where this is headed."

## Brevity
- **Cut trailing restaters.** If a sentence already makes the point, don't add a clause restating it.
- **Cut filler qualifiers.** "It's worth noting that", "In practice this is fine:", "This is a significant change". Just say the thing.
- **Cut unnecessary specificity.** When exact numbers don't matter, say "when the list gets long" not "200 items across 12 categories".
- **Cut editorializing parentheticals.** Don't tag a step or section with how important it is. No "(the key step)", "(what nailed it)", "(in order of usefulness)". Let the content carry the weight.
- **Don't announce summaries.** Drop labels like "Bottom line:", "TL;DR:", "In summary", "The takeaway:". State the conclusion as a plain sentence. If a section needs a label to surface its point, it's too long.
- **Prefer plain words over figurative or clever ones; clarity over cleverness.** Use the literal term, not a vivid, idiomatic, or jargon stand-in a reader has to translate. This applies to verbs, nouns, and casual phrasing alike:
  - **Verbs.** "Get the numbers" not "Grab the numbers". "Where the limit applies" not "where the limit bites". Avoid grab, nail, crack, bite, kick in, dominates, attacks, and similar.
  - **Nouns and metaphors.** Name the actual thing, not a metaphor for it. "scope of impact" not "blast radius". "the big efforts" not "the big lifts". "the better option" not "the better lever". "the main cost" not "the hot path". "the first set of changes" not "the first bundle".
  - **Casual stand-ins.** Use the precise word. "the files are 10-100 MB" not "the files run 10-100 MB". "a day of running in production" not "a day of prod bake". "negligible" not "a rounding error".
  - **No figurative "X is Y" equations.** Write "the approval step takes the most time", not "the approval step is the timeline". Name the actual relationship ("takes the most time", "is the largest cost", "accounts for most of the delay").
- **Prefer short sentences over long ones with multiple clauses.** Break up sentences joined by dashes or semicolons if they're getting long.

## Formatting
- **Use Oxford commas.** "the parser, the planner, and the executor" not "the parser, the planner and the executor".
- **No em dashes or double-dashes for parenthetical asides.** Use actual parentheses, colons, semicolons, or break into separate sentences.
  - No: `This is the cleanest approach -- no temporary state to clean up`
  - Yes: `This is the cleanest approach (no temporary state to clean up).`
  - Yes: `This is the cleanest approach. No temporary state to clean up.`

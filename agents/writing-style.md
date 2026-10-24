# Writing Style

Rules for all prose: notes, messages, email, summaries, commit messages, docs.

Write casually and concisely. Include enough context for the reader to do the task.

Engineering document structure, evidence, code comments, and source links are in
`writing-style-technical.md`. Chat-specific guidance is in
`writing-style-conversation.md`.

## Agent-facing instructions

- **Optimize for precise execution.** Prompts, skills, and agent instruction files should use explicit requirements, scope, technical identifiers, structured sections, and completion criteria. Human-facing tone and document-structure defaults do not apply to these instructions. Keep the shared rules for clarity, necessary context, and removing filler and repetition.
- **Separate instructions from their output.** When an agent will produce human-facing content, specify that content's audience, purpose, and applicable writing guidance separately. The prompt's execution sections do not prescribe the resulting document's headings.
- **Use agent-writing guidance when available.** When creating or editing prompts, skills, or agent instruction files, invoke `mattpocock-skills:writing-for-agents` if available, or its installed equivalent such as `writing-for-agents`. Use the name exposed by the current tool. If unavailable, continue with this section's guidance.

## Audience and context
- **Separate expertise from familiarity.** Treat engineering readers as technically capable colleagues. Determine their familiarity with the project, code, and incidents from the task and conversation.
- **Introduce what the explanation depends on.** Establish unfamiliar project-specific facts before using them to explain a finding or proposal. Explain general engineering concepts only when requested or necessary for the stated audience.
- **Match context to the task.** A familiar change may need one sentence of background; an unfamiliar investigation may need an introduction. Necessary context is part of the explanation.

## Tone and voice
- **Be direct, not formal.** "This doesn't cover renewals" not "It should be noted that this approach does not address renewal scenarios."
- **Write to the reader as a peer.** Don't switch into an announcement voice.
- **Use "we" only in my voice.** When drafting something I'll send as myself (PR bodies, standups, messages, review replies), use "we" for my team. In agent-written reports and proposals:
  - Describe the agent's research neutrally ("The investigation didn't…", "That test was read, not run").
  - For proposed actions, name who would act ("Ben and Alex would…"), use neutral wording ("The next step would…"), or state the request directly ("Approve X").
- **Soften proposals, not facts.** Use "would", "could", "might" for things we haven't done yet. Use declarative voice for things that exist today.
- **Don't editorialize.** Describe what something does and let the reader judge. Avoid "This is actually the desired behavior" or "That's exactly where this is headed."
- **Avoid ableist language.** Don't use "crazy", "sane", "insane", "sanity", or "insanity" as shorthand for technical behavior.
- **Avoid business jargon.** Prefer "match" over "align", "use" over "leverage", "request" over "ask" as a noun, and "investigate" over "deep dive".
- **Avoid marketing language.** Don't describe work as "seamless", "simple", "powerful", or "robust". State the behavior, options, and evidence.

## Brevity
- **Preserve necessary context and reasoning.** Shorten by removing filler and repetition. When revising for missing context, integrate it into the explanation and reread the whole opening rather than appending another explanation.
- **Cut trailing restaters.** If a sentence already makes the point, don't add a clause restating it.
- **Cut filler qualifiers.** "It's worth noting that", "In practice this is fine:", "This is a significant change". Just say the thing.
  - Keep qualifiers that carry evidence: certainty ("likely", "probably"), scope ("on its own", "automatically"), time ("as of October 22"), and source ("the notes recall", "the PR says"). Removing one changes the claim.
- **Cut unnecessary specificity.** When exact numbers don't matter, say "when the list gets long" not "200 items across 12 categories".
- **Cut editorializing parentheticals.** Don't tag a step or section with how important it is. No "(the key step)", "(what nailed it)", "(in order of usefulness)". Let the content carry the weight.
- **Don't announce summaries.** Drop labels like "Bottom line:", "TL;DR:", "In summary", "The takeaway:". State the conclusion as a plain sentence. Keep descriptive headings when they help navigation or belong to the requested format.
- **Prefer plain words over figurative or clever ones; clarity over cleverness.** Use the literal term, not a vivid, idiomatic, or jargon stand-in a reader has to translate. This applies to verbs, nouns, and casual phrasing alike:
  - **Verbs.** "Get the numbers" not "Grab the numbers". "Where the limit applies" not "where the limit bites". Avoid grab, nail, crack, bite, kick in, dominates, attacks, and similar.
  - **Nouns and metaphors.** Name the actual thing, not a metaphor for it. "scope of impact" not "blast radius". "the big efforts" not "the big lifts". "the better option" not "the better lever". "the main cost" not "the hot path". "the first set of changes" not "the first bundle".
  - **Casual stand-ins.** Use the precise word. "the files are 10-100 MB" not "the files run 10-100 MB". "a day of running in production" not "a day of prod bake". "negligible" not "a rounding error".
  - **No figurative "X is Y" equations.** Write "the approval step takes the most time", not "the approval step is the timeline". Name the actual relationship ("takes the most time", "is the largest cost", "accounts for most of the delay").
- **Prefer short sentences over long ones with multiple clauses.** Break up sentences joined by dashes or semicolons if they're getting long.

## Formatting
- **Prefer bulleted lists for distinct facts, conditions, and consequences.** Use bullets instead of long paragraphs when the points can stand on their own. Keep short paragraphs for summaries and reasoning that needs connected sentences.
- **Use Oxford commas.** "the parser, the planner, and the executor" not "the parser, the planner and the executor".
- **No em dashes or double-dashes for parenthetical asides.** Use actual parentheses, colons, semicolons, or break into separate sentences.
  - No: `This is the cleanest approach -- no temporary state to clean up`
  - Yes: `This is the cleanest approach (no temporary state to clean up).`
  - Yes: `This is the cleanest approach. No temporary state to clean up.`

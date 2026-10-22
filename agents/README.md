# Agent instructions

Shared writing instructions for coding agents.

[`AGENTS.md`](AGENTS.md) is the entry point. It imports the instruction files in this
directory:

- [`writing-style.md`](writing-style.md) covers shared prose rules: audience context,
  tone, brevity, and formatting.
- [`writing-style-conversation.md`](writing-style-conversation.md) covers chat
  replies to the user, with structure chosen for the question.

For engineering writing, `AGENTS.md` also applies
[`writing-style-technical.md`](writing-style-technical.md). It provides
document-specific defaults, evidence and uncertainty guidance, review replies,
code comments, and source links. The defaults describe reading order, not
mandatory headings. Use the requested format or repository template when provided.

Copy or symlink these files into the instruction location supported by your coding
agent. Keep them together so the relative imports continue to work.

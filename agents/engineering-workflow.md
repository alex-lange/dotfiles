# Engineering Workflow

Rules for changing code and collaborating in a repository.

## Git and pull requests

- Use verb-first kebab-case branch names, such as `fix-auth-timeout` or
  `add-user-search`.
- Don't prefix branches with a username, handle, initials, or agent name.
- Don't rebase, amend commits, or force-push without explicit permission.
- Don't merge a pull request without explicit permission for that pull request.
- Use the repository's pull request template when one exists.

## Editing code

- Preserve unrelated content. Make the smallest complete change that addresses the
  request.
- Search for unfamiliar functions, classes, modules, constants, and APIs before using
  them. Don't invent a symbol based on its name or expected behavior.
- Call out removed or renamed public symbols, routes, configuration keys, and other
  interfaces.

## Tests and validation

- Follow the existing test file's nesting, ordering, helpers, and setup conventions.
- Put new tests near the most relevant existing tests. Don't put them at the top unless
  that matches the file's structure.
- Don't claim a fix works without evidence. Run the relevant test, build, lint, or
  reproduction check and report the result.

## Cross-repository references

- When more than one repository is involved, identify the repository before editing or
  citing a file.
- Qualify cross-repository file references with the repository, ref, and path when that
  context is available.

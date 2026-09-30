#!/usr/bin/env python3
"""
Block `sed -n '...'` line-reading commands and redirect to the Read tool.
Claude has a built-in Read tool with offset/limit params that is better
suited for reading specific line ranges from files.
"""
import json
import re
import sys

data = json.load(sys.stdin)
cmd = data.get("tool_input", {}).get("command", "")

ENABLED = False

# Match sed -n with a line-address print pattern: e.g.
#   sed -n '10,20p'   sed -n '5p'   sed -n '10,$p'   sed -n 10p file
SED_N_LINE_READ = re.compile(
    r"\bsed\b"           # sed command
    r"(?:[^|;&\n]*)"     # any args (not across pipes/semicolons)
    r"-n\b"              # -n flag
    r"(?:[^|;&\n]*)"     # more args
    r"""['"]?\s*\d+"""   # line number (optionally quoted)
    r"(?:[,\$]\d*)?"     # optional ,end address
    r"\s*p"              # print command
)

if ENABLED and SED_N_LINE_READ.search(cmd):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": (
                "Use the Read tool instead of `sed -n` to read specific lines. "
                "Read supports offset and limit parameters:\n"
                "  Read(file_path=\"/path/to/file\", offset=10, limit=20)\n"
                "reads 20 lines starting at line 10 (1-indexed). "
                "This avoids a Bash call and keeps output structured."
            ),
        }
    }))

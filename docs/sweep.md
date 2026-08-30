# sweep

Finds every git repository on a machine and reports which ones hold work that
exists nowhere else. Built to run **before** a machine is erased.

```sh
bin/sweep                      # scan $HOME, write to ~/fleet-out/sweep
bin/sweep --root ~/Developer   # narrower scan
bin/sweep --quick              # skip network + large-file checks (fast)
bin/sweep --exclude Dropbox    # prune a directory name
```

## It does not take action

`sweep` never commits, pushes, creates repositories, or modifies a working
tree. It reads the *paths* of at-risk files, never their contents. Remediation
is a separate step, run after you have read the report — bulk-pushing years of
local experiments without secret scanning in front of it is how an API key ends
up on GitHub.

## What it checks, per repository

| Check | Why it matters |
|---|---|
| uncommitted tracked changes | ordinary in-flight work |
| untracked files | new files git has never seen |
| stashes | routinely forgotten |
| commits on any branch not on any remote | `git log --branches --not --remotes` |
| local branches with no upstream | whole lines of work with nowhere to go |
| **remote actually resolves** | a remote deleted server-side looks healthy locally |
| **gitignored files matching a risk list** | `.env`, `*.pem`, `credentials*` — invisible to every other check, and the reason a restored project won't run |
| files over 95 MB | GitHub rejects blobs over 100 MB; the repo may be unpushable |

The last three are the reason this exists rather than a `git status` loop.

## Scoring

Each repository is scored by how much of it exists nowhere else, then sorted
worst-first. Read top-down and stop when it goes quiet.

| Severity | Meaning |
|---|---|
| `critical` | no remote, unreachable remote, unpushed commits, or stashes |
| `high` | uncommitted changes, at-risk files |
| `medium` | untracked files, branches with no upstream, oversized files |
| `low` / `clean` | nothing that would be lost |

## Discovery

Walks `--root` with no depth cap — a depth limit silently misses nested work.
Prunes caches, `node_modules`, VM images, and `~/Library`.

**Dropbox is scanned by default.** Keeping repositories there is a bad idea, but
people do it, and missing one is worse than a slow scan. Use `--exclude` to skip.

## Output

- `sweep-report.txt` — for reading, worst-first
- `sweep.json` — same data, structured; the input to everything built later

Both contain repository paths and filenames from your machine. Treat as private.

## Portability

POSIX `sh`. Runs on macOS's `/bin/sh` with no dependency beyond `git`, so it
works on a machine before anything has been installed on it. Verified under
`dash`, `bash`, and `sh` against fixture repositories covering each case above.

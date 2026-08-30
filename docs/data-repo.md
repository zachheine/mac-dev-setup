# The data repo contract  — DRAFT, needs review

`fleet` is a tool with no opinions. What to install, for whom, on which machine
lives in a **data repo** — private, owned by you or your org, never public.

    zachheine/fleet              public   the tool
    zachheine/fleet-machines     private  personal machines
    teamprojects/fleet-machines  private  company machines + onboarding

Because more than one data repo exists and they evolve independently, this
layout is a contract. `fleet validate` checks a data repo against it.

## Layout

```
fleet.toml                 schema version, repo defaults
roles/<role>/              a capability bundle, composable
  Brewfile                 formulae, casks, mas ids
  defaults.sh              macOS prefs for this role
  dotfiles/                files linked into $HOME
profiles/<profile>/        a named composition
  profile.toml             roles = [...], plus notes
  Brewfile                 additions beyond the roles
machines/<machine>/
  machine.toml             hardware uuid, profile, overrides
  inventory.json           GENERATED — never hand-edited
deny.txt                   never install; stop asking about these
```

## Resolution order

    base role  →  profile roles (in order)  →  profile additions  →  machine overrides

Later layers win. `deny.txt` wins over everything: an entry there is never
installed regardless of which layer asked for it.

## Three rules that make it work across repos

**1. Identity is never committed.** No names, emails, signing keys, tokens, or
account handles in any layer. Identity is entered by `fleet init` and written to
`~/.config/fleet/identity.toml`, which is not in any repo. This is what lets the
same profile provision a machine for someone who is not you.

**2. `inventory.json` is generated, never edited.** It is what `fleet scan`
observed. Editing it by hand makes the tool lie about the machine. Intent goes
in a profile or an override; observation stays in the inventory.

**3. `deny.txt` is judgment, and it is the point.** Anything neither promoted
into a layer nor denied shows as *untriaged*, and untriaged is the queue you
burn down. Without a deny list you re-triage the same abandoned experiments
forever, which is how a setup repo rots.

## Machine identity

Machines are keyed by **hardware UUID**, not hostname:

```sh
ioreg -d2 -c IOPlatformExpertDevice | awk -F\" '/IOPlatformUUID/{print $(NF-1)}'
```

Hostnames change on reinstall — `zrh-office-mini-q6p0-local` is auto-generated
and would not survive an erase. Keying on the UUID means a machine keeps its
identity across renames, and a reinstalled machine is deliberately re-adopted
rather than silently appearing as a new one.

## Pointing the tool at a repo

`fleet` never authenticates or clones on its own. A data repo is just a
directory:

    FLEET_DATA=~/.fleet/data          default
    fleet --data <dir> ...            override

The bootstrap clones whichever repo you name into that path, so provisioning an
employee laptop from the company repo is a flag, not a code path.

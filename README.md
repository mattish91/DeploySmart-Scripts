# $$\textsf{\color{white}Deploy\textsf{\color{#0fda00}Smart}}$$ Scripts

DeploySmart's public PowerShell application library, intended to be browsed by
category and imported into a DeploySmart deployment after review.

**Default library source:** `mattish91/DeploySmart-Scripts`

## Filename-based discovery

Every `.ps1` file below `categories/` is a discoverable application. The
application name is derived from the filename without its extension:

- `categories/browsers/Firefox.ps1` appears as **Firefox**
- `categories/office/Microsoft_Office_365.ps1` appears as
  **Microsoft_Office_365**

No central `applications.json`, root catalog JSON, or per-script JSON file is
required when adding a script. The category comes from its containing folder.
An optional adjacent `Firefox.meta.json` can later provide a polished display
name, description, tags, version, supported scope, license, and requirements;
the script remains discoverable by filename if that sidecar is absent.

For the best automatically generated description, add PowerShell comment-based
help with `.SYNOPSIS` and `.DESCRIPTION` at the top of a script. A README beside
the script may document detailed use, licensing, and prerequisites.

## Layout

```text
categories/
  business/       Business and identity-related applications
  browsers/       Browser installers
  media/          Media and creative applications
  office/         Office deployment and explicitly configured activation tasks
    assets/       Generic Office Deployment Tool XML configurations
  security/       Security tools
    assets/       Support files consumed by scripts in that category
  utilities/      System, productivity, and utility installers
```

Scripts keep the same filename as their DeploySmart source counterpart. This
allows the existing catalog behavior that derives application names from
`*.ps1` filenames to work without a hand-maintained list.

## Support files

Keep a support file close to the scripts that use it, under that category's
`assets/` folder. Update the script to fetch it from the repository's raw URL.
For example, `ClamAV.ps1` uses `categories/security/assets/freshclam.conf`.
The Office deployment scripts use generic XML files in
`categories/office/assets/`.

When the default branch changes from `main`, update the raw URLs in scripts
that download support files. Prefer reviewed release tags or commit-pinned
sources for production use; the current `main` URLs are convenient for this
initial library layout, not immutable release references.

## Adding a script

1. Choose or create a category folder under `categories/`.
2. Add a descriptive `.ps1` filename. The filename is the fallback catalog
   name; avoid relying on a separate catalog JSON entry.
3. Add `.SYNOPSIS` and `.DESCRIPTION` comment-based help. Add an optional
   same-basename `.meta.json` only if richer listing metadata is needed.
4. Place needed text/configuration support files in the category's `assets/`
   directory and link to them using the repository's raw URL.
5. Check that the script contains no credentials, customer-specific settings,
   internal-only URLs, or unlicensed proprietary payloads. A script should not
   install or execute code fetched from an unreviewed location.
6. Validate PowerShell syntax, support-file references, and licensing. Review
   the complete script before importing it into a deployment.

## Security, scope, and licensing

PowerShell scripts execute with the permissions of their deployment context.
Treat every script and update as executable code: inspect it before use. The
DeploySmart importer should download an immutable, reviewed commit, verify
content hashes, show the script and support files before import, and never
execute scripts while browsing or importing them.

**Activation scripts need user configuration before use.** In DeploySmart,
edit the imported script under **Custom Scripts** and replace
`REPLACE_WITH_YOUR_AUTHORIZED_KMS_SERVER` in `$KmsServer` with your own
authorized KMS host. Each script stops while the placeholder remains unchanged.
If a company does not use KMS, do not import or deploy the activation script.
Review licensing and script requirements before importing. These scripts do
not provision a license or KMS service. The Windows Server setup key in its
activation script is a generic KMS client setup key, not a license or
activation service.

This repository is licensed under the MIT License; see `LICENSE`. That license
covers this repository's scripts and documentation, not the third-party
software, installers, or services that a script may download or use. Those
remain subject to their respective owners' terms.

Scripts previously stored under DeploySmart's `apps/Disabled/` folder are
intentionally not included. They contained a hard-coded BIOS setup password
and organization-specific/private download hosts. Review, rotate, and
generalize those separately before considering them for a public library.

# $$\textsf{\color{#6EE7B7}Deploy\textsf{\color{white}Smart Scripts}}$$

## Relationship to DeploySmart

This repository contains the public PowerShell application library used by DeploySmart.

The DeploySmart platform itself is developed separately and is not included in this repository.

DeploySmart-Scripts may be freely reused under the terms of the MIT License.

---

### Official DeploySmart Application Library

DeploySmart Scripts is the official PowerShell application library for DeploySmart.

The repository contains deployment-ready PowerShell scripts that can be imported into DeploySmart to automate application installation, configuration, and post-deployment tasks.

Applications are organized by category and designed to be reviewed, imported, customized, and deployed according to each organization's requirements.

---

## Features

- Application deployment scripts
- PowerShell automation tasks
- Business software installers
- Browser installers
- Media applications
- Security tools
- Office deployments
- Utility and productivity software
- Optional deployment assets and configuration files

---

## Default Library Source

```text
mattish91/DeploySmart-Scripts
```

This repository can be used as a default script source for DeploySmart deployments.

---

## Repository Structure

```text
categories/
│
├─ browsers/
├─ business/
├─ development
├─ gaming
├─ media/
├─ meeting
├─ office/
│   └─ assets/
├─ security/
│   └─ assets/
└─ utilities/
```

### Category Overview

| Category | Description |
|-----------|------------|
| business | Identity, collaboration and business applications |
| browsers | Web browsers and related tools |
| media | Media playback and creative applications |
| office | Microsoft Office deployment and productivity tools |
| security | Security, antivirus and compliance tools |
| utilities | General productivity and system utilities |

---

## Automatic Application Discovery

DeploySmart automatically discovers applications based on their filename and category location.

Example:

```text
categories/browsers/Firefox.ps1
```

Appears as:

```text
Firefox
```

Example:

```text
categories/office/Microsoft_Office_365.ps1
```

Appears as:

```text
Microsoft_Office_365
```

No central catalog file is required.

Application names, categories and script locations are determined directly from the repository structure.

---

## Optional Metadata

Additional application information may be provided through optional metadata files.

Example:

```text
Firefox.ps1
Firefox.meta.json
```

Metadata files may contain:

- Friendly display names
- Versions
- Categories
- Tags
- Descriptions
- Requirements
- License information

Scripts remain discoverable even if metadata files are not present.

---

## Script Documentation

Scripts should include PowerShell comment-based help whenever possible.

Example:

```powershell
<#
.SYNOPSIS
Installs Mozilla Firefox.

.DESCRIPTION
Downloads and installs Mozilla Firefox using official sources.
#>
```

This information may be used by DeploySmart to generate application descriptions and deployment information.

---

## Support Files

Some applications require additional configuration files or supporting assets.

Store these assets within the relevant category:

```text
categories/security/
├─ ClamAV.ps1
└─ assets/
   └─ freshclam.conf
```

Support files should:

- Be stored close to the script that requires them
- Use publicly accessible download locations when appropriate
- Avoid hard-coded credentials
- Avoid customer-specific configuration
- Avoid proprietary internal resources

---

## Adding New Applications

### 1. Select a Category

Choose an existing category or add a new one.

---

## Support DeploySmart

DeploySmart is an independent project developed and maintained by Mattias Magnusson.

If DeploySmart has helped your organization reduce deployment time, automate workflows, or simplify device provisioning, consider supporting ongoing development.

Support helps fund:

- Infrastructure
- Testing environments
- Development hardware
- Software licensing
- New features and integrations

The first 500 000 SEK will be going towards resolving a huge debt after a year of unemployment.

Contact:
mattias@mspot.se

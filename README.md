[//]: # (STANDARD README)
[//]: # (https://github.com/RichardLitt/standard-readme)
[//]: # (----------------------------------------------)
[//]: # (Uncomment optional sections as required)
[//]: # (----------------------------------------------)

[//]: # (Title)
[//]: # (Match repository name)
[//]: # (REQUIRED)

# estate-reusable-workflows

[//]: # (Banner)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (Must link to local image in current repository)


[//]: # (Badges)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)


[//]: # (Short description)
[//]: # (REQUIRED)
[//]: # (An overview of the intentions of this repo)
[//]: # (Must not have its own title)
[//]: # (Must be less than 120 characters)
[//]: # (Must match GitHub's description)

Reusable GitHub Actions workflows

[//]: # (Long Description)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (A detailed description of the repo)

This is our collection of [reusable GitHub Actions workflows](https://resources.github.com/learn/pathways/automation/intermediate/create-reusable-workflows-in-github-actions/). They are designed to be used across multiple repositories to ensure consistency and reduce duplication.


## Table of Contents

[//]: # (REQUIRED)
[//]: # (Delete as appropriate)

1. [Security](#security)
1. [Install](#install)
1. [Usage](#usage)
2. [Why does this matter?](#why-does-this-matter-)
1. [Contributing](#contributing)
1. [License](#license)

## Security
[//]: # (OPTIONAL)
[//]: # (May go here if it is important to highlight security concerns.)

Ensuring that our workflows are consistent across the estate is important for maintaining security and reliability.
It ensures that all repositories are built and tested in the same way, reducing the risk of vulnerabilities.

[//]: # (## Background)
[//]: # (OPTIONAL)
[//]: # (Explain the motivation and abstract dependencies for this repo)

## Install

[//]: # (Explain how to install the thing.)
[//]: # (OPTIONAL IF documentation repo)
[//]: # (ELSE REQUIRED)

### How to Add a New Workflow to the Estate
estate-reusable-workflows provides reusable GitHub Actions workflows that are automatically assigned to repositories based on their configuration. Instead of manually adding workflows to each repository, OpenTofu dynamically generates the correct calling workflows based on predefined conditions.

To install a new workflow into the estate:
1.	Create the workflow in `estate-reusable-workflows/.github/workflows/[workflow-name].yml`.
2.	Define all the conditions that are required for the workflow to be activated `estate-reusable-workflows/workflows.yml`.

Example:

```yaml
my-amazing-workflow:
  sky: blue
  grass: green
  coffee: hot
```

Once added, OpenTofu will ensure the workflow is applied wherever it is needed; no manual YAML copypasta required.


> [!IMPORTANT]
> **Workflow Naming Convention**
>
> - **All workflow filenames must be in lowercase kebab-case and end in `.yml`.**
> - **Names in `workflows.yml` and the `name:` field inside each workflow must be identical to the corresponding workflow filename, but without the `.yml` file extension.**
>
> ✅ **Correct:** `container-build-and-push.yml`, `deploy-infrastructure.yml`
> ❌ **Incorrect:** `Container_Build.yml`, `DeployInfrastructure.yml`, `deployInfrastructure.yml`
>
> This ensures consistency across repositories and avoids issues with case-sensitive systems.
> **Workflows that do not follow this convention may be rejected.**

### How to Add a Workflow to Your Repository

To enable a workflow for your repository, follow these steps:

1. **Find the workflow**
   - Open [`workflows.yml`](workflows.yml) and locate the workflow you need.
2. **Identify the enabling variable**
   - Check which variables control whether the workflow applies, as defined in [`workflows.yml`](workflows.yml)
3. **Add the variables to your repository configuration**
   - Open `estate-repos/repos.yml` and add the required variable under your repository’s entry.
4. **Let OpenTofu do the rest**
   - OpenTofu will automatically generate and apply the correct workflow.



## Usage
[//]: # (REQUIRED)
[//]: # (Explain what the thing does. Use screenshots and/or videos.)


Workflows are assigned automatically based on repository configuration, removing the need for manual workflow definitions.

Here is how it works:
1.	`estate-reusable-workflows` defines reusable workflows in `.github/workflows/`.
2.	Each workflow’s conditions are stored in `workflows.yml` to determine when it should apply.
3.	The repo configuration is defined in `repos.yml` in `estate-repos`.
4. `estate-repos` calls the `github/workflows` module in `tofu-modules`
5. The `github/workflows` module automatically
   1. fetches the `estate-reusable-workflows/workflows.yml` list
   2. generates the required caller workflows
   3. pushes generated caller workflows to each repository.

By defining workflows in a single place and letting OpenTofu handle their assignment, repositories always get the right workflows without YAML duplication or manual setup. 🚀




[//]: # (Extra sections)
[//]: # (OPTIONAL)
[//]: # (This should not be called "Extra Sections".)
[//]: # (This is a space for ≥0 sections to be included,)
[//]: # (each of which must have their own titles.)

## Why does this matter?
Automating workflow management helps to ensure that each repository’s configuration is fully defined in repos.yml, eliminating the need for manual intervention.
Workflows are dynamically assigned based on repository requirements, leading to:
- Better knowledge transfer – everything is centrally defined and easy to understand.
- Stronger DRY principles – no redundant YAML, just reusable logic.
- Consistent repository management – every repo gets exactly what it needs, nothing more, nothing less.
- No configuration drift – changes are always tracked, preventing inconsistencies. 🚀

Example:

A common frustration with polyrepo structures is the need to manually configure CI/CD for each new repository.
With this system, a single commit to repos.yml handles everything; defining repo configuration, enabling required workflows, and applying them automatically. 🚀

This approach makes workflow automation scalable, predictable, and effortless. ✅



[//]: # (## API)
[//]: # (OPTIONAL)
[//]: # (Describe exported functions and objects)



[//]: # (## Maintainers)
[//]: # (OPTIONAL)
[//]: # (List maintainers for this repository)
[//]: # (along with one way of contacting them - GitHub link or email.)



[//]: # (## Thanks)
[//]: # (OPTIONAL)
[//]: # (State anyone or anything that significantly)
[//]: # (helped with the development of this project)



## Contributing
[//]: # (REQUIRED)
If you need any help, please log an issue and one of our team will get back to you.

PRs are welcome.


## License
[//]: # (REQUIRED)

All our code is licenced under the AGPL-3.0. See [LICENSE](LICENSE) for more information.

---

The configuration of this repo is managed by OpenTofu in [estate-repos](https://github.com/evoteum/estate-repos).

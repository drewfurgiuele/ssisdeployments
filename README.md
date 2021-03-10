# SSIS Build and Deployment Automation Example

This respository is designed to serve as an example of how you can use Github repositories, actions, and runners to take care of building and deploying your SSIS projects.

## Requirements

While there exists marketplace actions that might simplify this process, should you not want to leverage these actions and keep control of the build and release process to yourself, you'll need to make sure you have the required capabilities:

1. **Github runner agent installed**: First, make sure you familiaize yourself with installing and configuring a github agent (called a runner) on a target virtual machine: [https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners]  (**NOTE**: When the runner is installed as a service, it will use the domain/local ID of the user who installed it. It's highly suggested you switch this to a domain service account!)
2. **Visual Studio with SSDT (2017+)**: In order to build your SSIS projects and solutions, you're going to need to make sure that you have Visual Studio with SSDT installed on the same machine as your Github runner. You can download those tools here: [https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15#ssdt-for-vs-2017-standalone-installer]
3. **An SSIS project checked in**: in your repository, check in a full solution folder, and for brevity, include a .gitignore that excludes your bin and .vs folders
4. **SQL Server permissions**: Whatever account you're using for your github runner, please make sure it has sufficient priveledges to deploy SSIS catalog packages to your target server.

## Build Process

To get started with the workflow, refer to the .github/workflows/main.yml file. The steps are pretty straight-forward: first, it uses a @checkout action to get the solution onto th agent, and then devenv.exe to build the solution which will output .ispac bundles. Then, it uses the ISDeploymentWizard.exe wizard command-line tool to deploy to the target SQL Server.

These tasks are encapsulted in PowerShell files to simplify the process, and the workflow calls these files via powershell shell type tasks.

## Considerations

Right now, target SSIS Servers, package catalogs, and other targets are declared as environment variables. These are used in the scripts to deploy.

## TO-DO

Explore SQL-based authentication options for this process.
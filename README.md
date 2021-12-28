# *__TODO:__ Insert project name*

*This repository serves as template for new repositories.*
*After creating a new repo from the template, adjust the following files (entries that need to be replaced are marked as **TODO**):*

- *Ensure the .NET Core SDK specified in `global.json` is the version that should be used for the new repo*
- Rename the Visual Studio solution `PROJECTNAME.sln` 
- *Update the NuGet packaging settings in `Directory.Build.props` (Properties marked as **TODO**)*
- *Define where the CI build should upload packages to in `build/Program.cs`*
- *Insert year and name into `LICENSE`*
- *Adjust the version in `version.json`*
- *Adjust the following sections in this README file*
- *Remove this section from this README file*

## Overview

*__TODO:__ Add status badges for package(s) on NuGet.org (and MyGet or Azure Artifacts), build status badge for Azure Pipeline*

## Installation

*__TODO:__ PACKAGENAME* is distributed as NuGet package.

- Prerelease builds are available on [MyGet](https://example.com) **TODO:** Provide package urls
- Prerelease builds are available on [Azure Artifacts](https://example.com) **TODO:** Provide package urls
- Release versions are available on [NuGet.org](https://example.com) **TODO:** Provide package urls

## Building from source

*__TODO:__ Provide info on how to build the project, e.g.*
Building it from source requires the .NET 6 SDK (version 6.0.101 as specified in [global.json](./global.json)) and uses [Cake](https://cakebuild.net/) for the build.

To execute the default task, run

```ps1
.\build.ps1
```

This will build the project, run all tests and pack the NuGet package.

## Acknowledgments

- [Nerdbank.GitVersioning](https://github.com/AArnott/Nerdbank.GitVersioning/)
- [ReportGenerator](https://github.com/danielpalme/ReportGenerator)
- [Cake](https://cakebuild.net/)
- [Cake.BuildSystems.Module](https://github.com/cake-contrib/Cake.BuildSystems.Module)
- ...
- *__TODO:__ Provide info about libraries used in this project*


## Versioning and Branching

The version of this project is automatically derived from git and the information
in `version.json` using [Nerdbank.GitVersioning](https://github.com/AArnott/Nerdbank.GitVersioning):

- The master branch  always contains the latest version. Packages produced from
  master are always marked as pre-release versions (using the `-pre` suffix).
- Stable versions are built from release branches. Build from release branches
  will have no `-pre` suffix
- Builds from any other branch will have both the `-pre` prerelease tag and the git
  commit hash included in the version string

To create a new release branch use the [`nbgv` tool](https://www.nuget.org/packages/nbgv/):

```ps1
dotnet tool restore
dotnet tool run nbgv -- prepare-release
```

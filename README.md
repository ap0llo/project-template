# *__TODO:__ Insert project name*

*This repository serves as template for new repositories.*
*After creating a new repo from the template, adjust the following files (entries that need to be replaced are marked as **TODO**):*

- *Update the NuGet packaging settings in `src\Directory.Build.props` (Properties marked as **TODO**)*
- *Adjust settings for CI builds in `azure-pipelines.yml`*
- *Ensure the .NET Core SDK specified in `global.json` is the version that should be used for the new repo*
- *Insert year and name into `LICENSE`*
- *Adjust the version in `version.json`*
- *Adjust the following sections in this README file*
- *Remove this section from this README file*

## Overview

*__TODO:__ Add status badges for package(s) on NuGet.org (and MyGet), build status badge for Azure Pipeline*

## Installation

*__TODO:__ PACKAGENAME* is distributed as NuGet package.

- Prerelease builds are available on [MyGet](https://example.com) **TODO:** Provide package urls
- Release versions are available on [NuGet.org](https://example.com) **TODO:** Provide package urls

## Building from source

*__TODO:__ Provide info on how to build the project, e.g.*

```bat
  dotnet restore .\src\PROJECTNAME.sln

  dotnet build .\src\PROJECTNAME.sln

  dotnet pack .\src\PROJECTNAME.sln
```

## Acknowledgments

*__TODO:__ Provide info about libraries used in this project*

## Versioning and Branching

*__TODO:__ Adjust versioning section if necessary*

The version of this library is automatically derived from git and the information
in `version.json` using [Nerdbank.GitVersioning](https://github.com/dotnet/Nerdbank.GitVersioning):

- The master branch  always contains the latest version. Packages produced from
  master are always marked as pre-release versions (using the `-pre` suffix).
- Stable versions are built from release branches. Build from release branches
  will have no `-pre` suffix
- Builds from any other branch will have both the `-pre` prerelease tag and the git
  commit hash included in the version string

To create a new release branch use the [`nbgv` tool](https://www.nuget.org/packages/nbgv/)
(at least version `3.0.4-beta`):

```ps1
dotnet tool install --global nbgv --version 3.0.4-beta
nbgv prepare-release
```

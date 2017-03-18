# C# Project template

This is a description of how I like to structure my C# projects / repositories.

Root directory
---------------
In the root - depending on the project - there are 2 to 4 main directories

- src : This is where all the actual source code of the project goes
- build: All the build output (including intermediate files) will be written there.
  Having all the files in a single spot makes deleting build outputs quite easy
- docs: Documentation files
- deps: If necessary, I add projects I depend on as git submodule here. However, if possible
  I try to use nuget for as many of the dependencies as possible.         

Aside from the main folder, the root directory contains:
- Build.bat: A batch script to build the entire project from the commandline.
  This will just call msbuild for the `build.proj` project.
  The project offers `Build` and `Clean` targets (for all projects) as well as
  a `Test` target to run unit tests for all test projects.  
  (The test target here uses [xunit](http://xunit.github.io/))
- dir.properties and dir.targets: MSBuild files to specify properties and targets that apply to all projects in the 
  repository (e.g. the output path is set here)

src
---
    src
     |--MyAssembly
            |--main
                |--MyAssembly.csproj
            |--test
                |--MyAssembly.Test.csproj
     |--MyProject.sln

The src directory contains the Visual Studio solution file and one directory per assembly. Similar to how java build systems 
(like gradle) structure projects, I add another hierarchy level ("main" and "test"), so each of the project directories actually contains two C# projects
(the main project and an associated unit test project).

Though there aren't always unit tests for every project, I think it's a good practice to create the unit test project
right away to reduce the effort required to add tests later on.

As already mentioned, the root directory contains centralized MSBuild settings (dir.properties / dir.targets). 
These files are included in the csproj project files using the _GetDirectoryNameOfFileAbove_ function.
This function starts at the current directory and walks up the file system hierarchy until it encounters a 
file with a specified name.   

This makes it possible to add additional MSBuild files "between" the project and the root directory 
(for example to specify settings that only apply to a single project and its unit test project).
By adding another Import statement in these files, the settings from more "high-level" settings files can
still be included.

The import statement for the dir.properties file in the csproj / other dir.properties files 
should look something like this

        <Import Project="$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.properties))\dir.properties" 
                Condition="'$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.properties))' != '' " />

I like to specify the output path and the path of the intermedia build results in the root's
dir.properties files. However, the OutputPath property is overwritten in the csproj files created by
Visual Studio, so the OutputPath needs to be deleted from these project files.


Dependencies
------------
When using nuget for dependency management, I prefer to use a project.json
file instead of the "old" packages.config. project.json supports transitive dependencies
and will not put all dependenices of the packages you're using in the packages file.

This is currently only [partially supported](https://github.com/NuGet/Home/wiki/Converting-a-csproj-from-package.config-to-project.json) 
for "classic" csproj projects and is only intendend from UWP and .Net Core projects
but works fine for most packages  
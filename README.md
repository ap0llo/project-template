# C# Project template

 - Build.ps1 is a generic build scripts that automatically finds solutions and runs nuget restore and msbuild for them
 - The solution should be put into a directory named 'src'
 - In every csproj file, add 

        <Import Project="$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.properties))\dir.properties" 
                Condition="'$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.properties))' != '' " />

    at the top of the file, to automatically pick up the settings defined in dir.properties

    **Note: The output path is set in dir.properties. The csproj files created by Visual Studio
            Override this setting. You should remove it from the csproj in order to use the output 
            path defined in dir.properties**

- If you define targets in dir.targets, you can include them in csproj files in
  a similar manner (targets are usually imported at the end)

        <Import Project="$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.targets))\dir.targets" 
                Condition=" '$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildThisFileDirectory).., dir.targets))' != '' " />    


- You can also add additional dir.properties / dir.targets files in the file system hierarchy
  between the csproj and the root folder. The csproj will import them automatically.
  To include the settings from the files higher up in the hierarchies, you'll need
  to add imports like the ones in the csproj to the additional files, too                        
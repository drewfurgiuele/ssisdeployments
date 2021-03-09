$Workspace = $env:GITHUB_WORKSPACE
$Solution = Get-ChildItem -Path "$Workspace\*"  | Where-Object {$_.Extension -eq ".sln"}
$Projects = Get-ChildItem -Path "$Workspace\*\*"  | Where-Object {$_.Extension -eq ".dtproj"}

foreach ($p in $Projects) {
    $SolutionFulleName = $Solution.FullName
    $ProjectFullName = $p.fullname
    $Command = "`"C:\Program Files (x86)\Microsoft Visual Studio\2017\SQL\Common7\IDE\devenv.exe`" `"$SolutionFulleName`" /ReBuild Development /Project `"$ProjectFullName`""

    & $Command
    
}
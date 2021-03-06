$Workspace = $env:GITHUB_WORKSPACE
$Solution = Get-ChildItem -Path "$Workspace\*"  | Where-Object {$_.Extension -eq ".sln"}
$Projects = Get-ChildItem -Path "$Workspace\*\*"  | Where-Object {$_.Extension -eq ".dtproj"}

foreach ($p in $Projects) {
    $SolutionFulleName = $Solution.FullName
    $ProjectFullName = $p.fullname
    $Command = "devenv.exe $SolutionFulleName /ReBuild Development /Project $ProjectFullName"
    Write-Host $Command
    Invoke-Expression $Command
    
}
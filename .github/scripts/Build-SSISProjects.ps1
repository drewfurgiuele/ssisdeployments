$Workspace = $env:GITHUB_WORKSPACE
$Solution = Get-ChildItem -Path "$Workspace\*"  | Where-Object {$_.Extension -eq ".sln"}
$Projects = Get-ChildItem -Path "$Workspace\*\*"  | Where-Object {$_.Extension -eq ".dtproj"}

Write-Host $Workspace


foreach ($p in $Projects) {
    $SolutionFulleName = $Solution.FullName
    $ProjectFullName = $p.fullname
    Write-Host $ProjectFullName
    $Command = "devenv `"$SolutionFulleName`" /ReBuild Development /Project `"$ProjectFullName`""
    & $Command
    Invoke-Command $Command
    
}
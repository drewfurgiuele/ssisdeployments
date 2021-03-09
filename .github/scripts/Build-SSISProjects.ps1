$Workspace = $env:GITHUB_WORKSPACE
$Solution = Get-ChildItem -Path "$Workspace\*"  | Where-Object {$_.Extension -eq ".sln"}
$Projects = Get-ChildItem -Path "$Workspace\*\*"  | Where-Object {$_.Extension -eq ".dtproj"}

Write-Host $Workspace


foreach ($p in $Projects) {
    $SolutionFulleName = $Solution.FullName
    $ProjectFullName = $p.fullname
    Write-Host $ProjectFullName
    $Command = "C:\Program Files (x86)\Microsoft Visual Studio\2017\SQL\Common7\IDE\devenv.exe `"$SolutionFulleName`" /ReBuild Development /Project `"$ProjectFullName`""
    
    Start-Process -FilePath $Command -Wait
    
}
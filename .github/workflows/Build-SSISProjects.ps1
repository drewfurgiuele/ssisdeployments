$Workspace = $env:GITHUB_WORKSPACE
$Projects = Get-ChildItem -Path "$Workspace\*\*"  | Where-Object {$_.Extension -eq ".dtproj"}

foreach ($p in $Projects) {
    $ProjectFullName = $p.fullname
    Write-Host $ProjectFullName
    #$Command = "devenv `"C:\Users\drew.BOATMURDER\source\repos\SampleSSISProject\SampleSSISProject.sln`" /ReBuild Development /Project `"C:\Users\drew.BOATMURDER\source\repos\SampleSSISProject\SampleSSISProject\SampleSSISProject.dtproj`""
    #Write-Host $Command
    
}
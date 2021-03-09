$Workspace = $env:GITHUB_WORKSPACE
$ISPacs = Get-ChildItem -Path $Workspace -Recurse | Where-Object {$_.extension -eq ".ispac"}

foreach ($i in $Ispacs) {
    $ispacFullPath = $i.Fullname
    $Command = "ISDeploymentWizard.exe /Silent /ModelType:Project /SourcePath:`"$ispacFullPath`" /DestinationServer:`"DEV-SQL-01`" /DestinationPath:`"/SSISDB/Testing/SampleSSISProject`""
    Write-Host $Command
    Invoke-Expression $Command    
}
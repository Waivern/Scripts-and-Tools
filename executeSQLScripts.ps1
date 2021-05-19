param(
    [string]$sqlFolder,
    [string]$serverName,
    [string]$databaseName
)
Get-ChildItem -path $sqlFolder -recurse -Filter *.sql | foreach{
Write-Host "execute: " + $_.FullName
sqlcmd -S $serverName -U user -P password -d $databaseName -i $_.FullName -b
}
$baseDir = $PSScriptRoot
$genRelDir = "src/lib/.generated"
$genFullDir = Join-Path -Path $baseDir -ChildPath $genRelDir

Get-ChildItem -Path $genFullDir -Include * | Remove-Item -Recurse

Write-Host baseDir=$baseDir
Write-Host genRelDir=$genRelDir
Write-Host genFullDir=$genFullDir

# Generate the required files
docker run --rm -v ${baseDir}:/local `
    swaggerapi/swagger-codegen-cli generate `
    -i https://api.finbourne.com/swagger/v0/swagger.json `
    -l typescript-angular `
    -o /local/$genRelDir

# Modify the generated code for angular 6

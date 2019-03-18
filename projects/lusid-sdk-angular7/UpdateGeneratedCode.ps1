$baseDir = $PSScriptRoot
$genRelDir = "src/lib/generated"
$genFullDir = Join-Path -Path $baseDir -ChildPath $genRelDir

# Remove any existing generated files
Get-ChildItem -Path $genFullDir -Include * | Remove-Item -Recurse

# Generate the required files
docker run --rm -v ${baseDir}:/local `
    swaggerapi/swagger-codegen-cli generate `
    -i https://api.lusid.com/swagger/v0/swagger.json `
    -l typescript-angular `
    -o /local/$genRelDir `
    --additional-properties ngVersion=7

# Delay as otherwise files may still be in use
Start-Sleep -Seconds 5

# Modify the generated code for angular 6
$tsFiles = Get-ChildItem -Path $genFullDir -Filter *.ts -Recurse
foreach ($file in $tsFiles) {
    ( Get-Content $file.FullName) | ForEach-Object { $_ -replace "from 'rxjs/Observable';", "from 'rxjs';" } | Set-Content $file.FullName
}

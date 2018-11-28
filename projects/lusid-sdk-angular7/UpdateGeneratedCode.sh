#!/bin/bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
genRelDir="src/lib/generated"
genFullDir=$baseDir/$genRelDir

# Remove any existing generated files
if [ -d $genFullDir ]; then
    rm -r $genFullDir
fi

# Generate the required files
docker run --rm -v ${baseDir}:/local \
    swaggerapi/swagger-codegen-cli generate \
    -i https://api.lusid.com/swagger/v0/swagger.json \
    -l typescript-angular \
    -o /local/$genRelDir

# Modify the generated code for angular 6
$tsFiles = Get-ChildItem -Path $genFullDir -Filter *.ts -Recurse
foreach ($file in $tsFiles) {
    ( Get-Content $file.FullName) | ForEach-Object { $_ -replace "from 'rxjs/Observable';", "from 'rxjs';" } | Set-Content $file.FullName
}

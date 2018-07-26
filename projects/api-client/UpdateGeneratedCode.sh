#!/bin/bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
genRelDir="src/lib/.generated"
genFullDir=$baseDir/$genRelDir

# Remove any existing generated files
if [ -d $genFullDir ]; then
    rm -r $genFullDir
fi

# Generate the required files
docker run --rm -v ${baseDir}:/local \
    swaggerapi/swagger-codegen-cli generate \
    -i https://api.finbourne.com/swagger/v0/swagger.json \
    -l typescript-angular \
    -o /local/$genRelDir


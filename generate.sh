#!/bin/bash -e

printf "ARGS: %s\n" "$*"

if [[ ${#1} -eq 0 ]]; then
    echo
    echo "[ERROR] swagger file not specified"
    exit 1
fi

angular_version=${2:-11};

gen_root=/usr/src
sdk_output_folder=$gen_root/projects/lusid-sdk-angular$angular_version/src/lib/generated
swagger_file=$gen_root/$1
echo "gen_root $gen_root"
echo "swagger file $swagger_file"
echo "sdk output folder: $sdk_output_folder"
echo "angular version $angular_version"

echo "stop ng from prompting to use analytics (ng analytics off)"
ng analytics off

# remove all previously generated files
shopt -s extglob
echo "removing previous sdk: folder=$sdk_output_folder"
rm -rf $sdk_output_folder/
shopt -u extglob

echo "generating the LUSID API sdk (angular version '$angular_version')"

java -jar /usr/swaggerjar/openapi-generator-cli.jar generate \
    -i $swagger_file \
    -g typescript-angular \
    -o $sdk_output_folder \
    -c $gen_root/config.json \
    --type-mappings object=any \
    --additional-properties supportsES6=true \
    --additional-properties ngVersion=$angular_version

cd $gen_root

sdk_version=$(cat $swagger_file | jq -r '.info.version')

echo "updating version in package.json to '$sdk_version'"
package_json=$gen_root/projects/lusid-sdk-angular$angular_version/package.json
cat $package_json | jq -r --arg SDK_VERSION "$sdk_version" '.version |= $SDK_VERSION' > temp && mv temp $package_json

echo "node version: $(node --version)"
echo "npm version: $(npm --version)"

echo "installing packages (using 'npm ci')"
npm ci

echo "ng version"
ng --version

echo "building package ('ng build lusid-sdk-angular$angular_version')"
ng build lusid-sdk-angular$angular_version

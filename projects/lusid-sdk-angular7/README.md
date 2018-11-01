# LUSID<sup>®</sup> angular (6+) SDK

This repository enables the generation of an angular (6+) SDK from the FINBOURNE OpenAPI specification using the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) tool.

The code required to generate the SDK is in the `projects/lusid-sdk-angular7` folder, and the most up to date version of the OpenAPI specification can be downloaded from https://api.finbourne.com/swagger/v0/swagger.json

# Generating the SDK

## PowerShell

* auto-generate typescript code from the latest LUSID OpenAPI specification. From the project root folder:

    `.\projects\lusid-sdk-angular7\UpdateGeneratedCode.ps1`

* update the version number of the SDK. From the `projects\lusid-sdk-angular7` folder:

    update the `version` in the `package.json` file (*_you should not need to do this as the published version should be part of the LUSID CI process_*)

* create a new version of the SDK. From the project root folder:

    `ng build lusid-sdk-angular7`

    This will create the new SDK in `dist\lusid-sdk-angular7`

* update the published [npm](https://preview.npmjs.com/package/@finbourne/lusid-sdk-angular7) package. From the `dist\lusid-sdk-angular7` folder 

    `cat package.json` (to check the version number that will be used)

    `npm publish` (*_you should not need to do this as the published version should be part of the LUSID CI process_*)
)


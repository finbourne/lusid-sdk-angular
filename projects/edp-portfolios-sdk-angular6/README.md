# EDP Portfolios angular (6+) SDK

This repository enables the generation of an angular (6+) SDK from the FINBOURNE OpenAPI specification using the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) tool.

The code required to generate the SDK is in the `projects/edp-portfolios-sdk-angular6` folder, and the most up to date version of the OpenAPI specification can be downloaded from ???

# Generating the SDK

## PowerShell

* auto-generate typescript code from the latest OpenAPI specification. From the project root folder:

    `.\projects\edp-portfolios-sdk-angular6\UpdateGeneratedCode.ps1`

* update the version number of the SDK. From the `projects\epd-portfolios-sdk-angular6` folder:

    update the `version` in the `package.json` file (*_you should not need to do this as the published version should be part of the LUSID CI process_*)

* create a new version of the SDK. From the project root folder:

    `ng build edp-portfolios-sdk-angular6`

    This will create the new SDK in `dist\edp-portfolios-sdk-angular6`

* update the published [npm](https://preview.npmjs.com/package/@finbourne/edp-portfolios-sdk-angular6) package. From the `dist\edp-portfolios-sdk-angular6` folder 

    `cat package.json` (to check the version number that will be used)

    `npm publish` (*_you should not need to do this as the published version should be part of the LUSID CI process_*)
)


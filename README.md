# OneSky Fastlane Plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-onesky)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-onesky`, add it to your project by running:

```bash
fastlane add_plugin onesky
```

## About

This fastlane plugin helps you to update the translations of your app using the OneSky service. You can upload your current base localization file with `onesky_upload` and download new translations with `onesky_download` from OneSky.

OneSky is a translation service for to help ypu translate your iOS, Android, Websites and Software. TO find out more about the OneSky Service, please head over to http://www.oneskyapp.com.

## Reference and Example

The OneSky fastlane plugin provides two new actions: `onesky_upload` and `onesky_download`

### `onesky_upload`

Uploads a new translation file to the onesky service.

````ruby
onesky_upload(
      public_key: "abc123abc123abc123abc123abc123abc",
      secret_key: "xyz890xyz890xyz890xyz890xyz890xyz",
      project_id: "1234",
      strings_file_path: "./localizations/en.xliff",
      strings_file_format: "XLIFF",
      deprecate_missing: true
    )
````

Parameter | Description
--------- | -----------
`public_key` | Your OneSky account public key. You retrive it by logging into your OneSky account, go to *Settings* and then *API Keys & Usages*.
`private_key` | Your OneSky account private key. You retrive it by logging into your OneSky account, go to *Settings* and then *API Keys & Usages*.
`project_id` | The ID of the project you want the tranlstions uploaded for. You retrive it, by logging into your OneSky account, navigate to your projects overview and copy the number behind the # in the brackets. (i.e. (#1234) -> `"1234"`)
`strings_file_path` | The file path to the localization file you want to upload.
`strings_file_format` | The format of localization file you want to upload. For more information about the available types head over to https://github.com/onesky/api-documentation-platform/blob/master/reference/format.md.
`deprecate_missing` | *(optional)* Indicates whether the strings that aren't available in the new translation file should be marked as deprecated. Defaults to `false`.

### `onesky_download`

Uploads a new translation file to the onesky service.

````ruby
onesky_download(
      public_key: "abc123abc123abc123abc123abc123abc",
      secret_key: "xyz890xyz890xyz890xyz890xyz890xyz",
      project_id: "1234",
      locale: "de",
      filename: "en.xliff",
      destination: "./localizations/de.xliff"
    )
````

Parameter | Description
--------- | -----------
`public_key` | Your OneSky account public key. You retrive it by logging into your OneSky account, go to *Settings* and then *API Keys & Usages*.
`private_key` | Your OneSky account private key. You retrive it by logging into your OneSky account, go to *Settings* and then *API Keys & Usages*.
`project_id` | The ID of the project you want the tranlstions downloaded for. You retrive it, by logging into your OneSky account, navigate to your projects overview and copy the number behind the # in the brackets. (i.e. (#1234) -> `"1234"`)
`locale` | The locale your wnat to download the translation for.
`filename` | The filename fo the file you want the translation for. It is the name of your original uploaded file.
`destination` | Filepath of the file to write the translations to.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use 
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## Acknowledgements
The code for the upload action is based on the fastlane plugin `upload_to_onesky` by @joshrlesch:
https://github.com/joshrlesch/fastlane-plugin-upload_to_onesky


This plugin was developed for and during the work on the [Youpooly iOS App](https://www.youpooly.com).

# sharethemeal plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-sharethemeal)

## About sharethemeal

[fastlane](https://fastlane.tools) saves as hours of work, wich eventually saves us a lot of money.
this is my try to remind myself to give, on every deploy using [fastlane](https://fastlane.tools).

Opens a Browser with the Payment page of [ShareTheMeal](https://sharethemeal.org/)

to get the parameter values, please donate once per app - and extract the values from the URL.

> As this only opens the pre-filled donate page in your browser, this doesn't work on a CI

## Example

```ruby
  sharethemeal(
  amount: "0.4",
  userhash: "xxxxx",
  language: "de",
  beneficiaryUri: "xxxxx",
  beneficiarySource: "contentful",
  thankYouUri: "xxxxxx"
)
```

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-sharethemeal`, add it to your project by running:

```bash
fastlane add_plugin sharethemeal
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

# ShareTheMeal Plugin for Fastlane

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-sharethemeal)

<img src='https://sharethemeal.org/assets/img/apps-de@2x-c5fe00ca10.png' height=250>
![Screenshot](screen.png)

## About
> This Plugin Enables unattended automated Donations of any size to the ShareTheMeal Inititative from the World-Food-Program

[fastlane](https://fastlane.tools) saves us hours of work, which eventually saves us a lot of money.
This is my way of reminding myself to give, on every deploy using [fastlane](https://fastlane.tools).


## ShareTheMeal

ShareTheMeal is a crowdfunding application to fight global hunger launched by the United Nations World Food Programme (WFP) in 2015. It enables users to make small donations to specific WFP projects and to track its progress. As of August 2016, ShareTheMeal has over 600,000 downloads and 7 million meals shared.


## Setup
### Add Plugin
```
fastlane add_plugin sharethemeal
```

### Get your UserHash
In Order to automate donation you require to store your payment method (preffered PayPal)
So do a single donation, on iOS this opens a Safari instance, look at the url and extract your `userHash`

Download The App to your Mobile.

| Platform | Link |
|----------|:-------------:|
| iOS |  [AppStore](https://click.google-analytics.com/redirect?tid=UA-58737077-1&url=https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Fsharethemeal%2Fid977130010&aid=org.sharethemeal.app&idfa=%{idfa}&cs=stmwebsite&cm=website&cn=permanent) |
| Android |    [PlayStore](https://play.google.com/store/apps/details?id=org.sharethemeal.app&referrer=utm_source%3Dstmwebsite%26utm_medium%3Dwebsite%26utm_campaign%3Dpermanent)    |

**Donate Once**, in the Safari instance that opens - you'll find your `userHash` - this is required to automate the donation.

## Example

```ruby
lane :donate do
  sharethemeal(
    amount: "0.4",
    userhash: "XXX",
    currency: "EUR",
    team_id: "fastlane"
  )
end
```

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.


## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

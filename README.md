# RTFInput

[![CI Status](https://img.shields.io/travis/n.kusyumov@mail.ru/RTFInput.svg?style=flat)](https://travis-ci.org/n.kusyumov@mail.ru/RTFInput)
[![Version](https://img.shields.io/cocoapods/v/RTFInput.svg?style=flat)](https://cocoapods.org/pods/RTFInput)
[![License](https://img.shields.io/cocoapods/l/RTFInput.svg?style=flat)](https://cocoapods.org/pods/RTFInput)
[![Platform](https://img.shields.io/cocoapods/p/RTFInput.svg?style=flat)](https://cocoapods.org/pods/RTFInput)

## Demo



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### Cocoapods

RTFInput is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RTFInput'
```

Then, run the following command:

```ruby
$ pod install
```

## Quick Start

**1. Import RTFInput**

Import RTFInput module where you want to use it:

```swift
import RTFInput
```
**2. Initialization**

Create `RTFInput` by code, using initializer.

```swift
lazy var textInputView = RTFInput()
```

**2. Customize**

You can easily edit any of the elements as you want! All you need is to change setting.
`RTFInputSetting` is required for `RTFInput` to work properly, which concise all the settings and customizations together into one single builder function. Here are the steps:

1. Initialize `RTFInputSetting` instance by using `RTFInputSetting.Builder`
2. Add features & customizations
3. Setup `RTFInput` by created `RTFInputSetting` instance

**- change theme**

<p align="center">
    <img src="./Screenshots/theme.gif">
</p>

You can easily change the theme, just specify one of the values:
- standard (Default)

```swift
.theme(.standard)
```

- dark

```swift
.theme(.dark)
```

- light

```swift
.theme(.light)
```

Please note that if theme and color customization, e.g. textColor, are both setup in builder, the text color from theme will be ignored.

**- change background color**

**- change text color**
**- change placeholder color**
**- change secure value**
**- change max lenght**
**- change input type**
**- change floating and warning hints**

## Author

Nikita Kusyumov, n.kusyumov@mail.ru

## License

RTFInput is available under the MIT license. See the LICENSE file for more info.

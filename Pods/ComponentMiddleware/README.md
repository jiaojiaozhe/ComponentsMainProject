# ComponentMiddleware

[![CI Status](https://img.shields.io/travis/jiaojiaozhe/ComponentMiddleware.svg?style=flat)](https://travis-ci.org/jiaojiaozhe/ComponentMiddleware)
[![Version](https://img.shields.io/cocoapods/v/ComponentMiddleware.svg?style=flat)](https://cocoapods.org/pods/ComponentMiddleware)
[![License](https://img.shields.io/cocoapods/l/ComponentMiddleware.svg?style=flat)](https://cocoapods.org/pods/ComponentMiddleware)
[![Platform](https://img.shields.io/cocoapods/p/ComponentMiddleware.svg?style=flat)](https://cocoapods.org/pods/ComponentMiddleware)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ComponentMiddleware is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ComponentMiddleware'
```

## Author

jiaojiaozhe, lanbiao@zhihuihutong.com

## License

ComponentMiddleware is available under the MIT license. See the LICENSE file for more info.

## Publish
本地验证： pod lib lint ComponentMiddleware.podspec --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
本地验证&远程验证: pod spec lint --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
发布：pod repo push jiaojiaozhe ComponentMiddleware.podspec  --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

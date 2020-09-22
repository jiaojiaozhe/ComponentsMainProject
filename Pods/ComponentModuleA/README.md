# ComponentModuleA

[![CI Status](https://img.shields.io/travis/jiaojiaozhe/ComponentModuleA.svg?style=flat)](https://travis-ci.org/jiaojiaozhe/ComponentModuleA)
[![Version](https://img.shields.io/cocoapods/v/ComponentModuleA.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleA)
[![License](https://img.shields.io/cocoapods/l/ComponentModuleA.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleA)
[![Platform](https://img.shields.io/cocoapods/p/ComponentModuleA.svg?style=flat)](https://cocoapods.org/pods/ComponentModuleA)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ComponentModuleA is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ComponentModuleA'
```

## Author

jiaojiaozhe, lanbiao@zhihuihutong.com

## License

ComponentModuleA is available under the MIT license. See the LICENSE file for more info.

## Publish
本地验证： pod lib lint ComponentModuleA.podspec --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
本地验证&远程验证: pod spec lint --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
发布：pod repo push jiaojiaozhe ComponentModuleA.podspec  --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

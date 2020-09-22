# ComponentMainModule

[![CI Status](https://img.shields.io/travis/jiaojiaozhe/ComponentMainModule.svg?style=flat)](https://travis-ci.org/jiaojiaozhe/ComponentMainModule)
[![Version](https://img.shields.io/cocoapods/v/ComponentMainModule.svg?style=flat)](https://cocoapods.org/pods/ComponentMainModule)
[![License](https://img.shields.io/cocoapods/l/ComponentMainModule.svg?style=flat)](https://cocoapods.org/pods/ComponentMainModule)
[![Platform](https://img.shields.io/cocoapods/p/ComponentMainModule.svg?style=flat)](https://cocoapods.org/pods/ComponentMainModule)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ComponentMainModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ComponentMainModule'
```

## Author

jiaojiaozhe, lanbiao@zhihuihutong.com

## License

ComponentMainModule is available under the MIT license. See the LICENSE file for more info.

## Publish
本地验证： pod lib lint ComponentMainModule.podspec --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
本地验证&远程验证: pod spec lint --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
发布：pod repo push jiaojiaozhe ComponentMainModule.podspec  --verbose --allow-warnings --sources='https://github.com/jiaojiaozhe/XAbstractionLibrary-Specs,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

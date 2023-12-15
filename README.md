# DEACBilayerTabBarViewController

[![CI Status](https://img.shields.io/travis/12740181/DEACBilayerTabBarViewController.svg?style=flat)](https://travis-ci.org/12740181/DEACBilayerTabBarViewController)
[![Version](https://img.shields.io/cocoapods/v/DEACBilayerTabBarViewController.svg?style=flat)](https://cocoapods.org/pods/DEACBilayerTabBarViewController)
[![License](https://img.shields.io/cocoapods/l/DEACBilayerTabBarViewController.svg?style=flat)](https://cocoapods.org/pods/DEACBilayerTabBarViewController)
[![Platform](https://img.shields.io/cocoapods/p/DEACBilayerTabBarViewController.svg?style=flat)](https://cocoapods.org/pods/DEACBilayerTabBarViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DEACBilayerTabBarViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

source 'https://github.com/zhigangwu/AnimationCollectionSpec.git'
pod 'DEACBilayerTabBarViewController'

// import
import DEACBilayerTabBarViewController

// 继承
DEACBilayerTabBarViewController

// 小图标
self.smallIconArray = ["****","****","****","****"] 

// 大图标
self.bigIconArray = ["****","****","****","****"] 

// 标题
self.titleArray = ["****","****","****","****"] 

// 显示的是大图标多在视图的宽度和高度 图标尺寸要小
self.bigItemWidth = 50 
self.bigItemHeight = 50   

// 默认显示项
self.defaultSelectIndex = 1 

// 标题默认选中颜色和选中颜色
self.defaultColor = .lightGray
self.selectedColor = .orange

// 添加控制器
self.viewControllerArray = [HistoryViewController(),TeamViewController(),DriverViewController(),NewsViewController()]

```

## Author

Ryan, 1402832352@qq.com

## License

DEACBilayerTabBarViewController is available under the MIT license. See the LICENSE file for more info.

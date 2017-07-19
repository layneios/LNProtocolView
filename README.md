# LNProtocolView

[![Version](https://img.shields.io/cocoapods/v/LNProtocolView.svg?style=flat)](http://cocoapods.org/pods/LNProtocolView)
[![License](https://img.shields.io/cocoapods/l/LNProtocolView.svg?style=flat)](http://cocoapods.org/pods/LNProtocolView)
[![Platform](https://img.shields.io/cocoapods/p/LNProtocolView.svg?style=flat)](http://cocoapods.org/pods/LNProtocolView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objc
LNProtocolView *protocolView = [[LNProtocolView alloc] initWithFrame:CGRectZero];
protocolView.backgroundColor = [UIColor groupTableViewBackgroundColor];
[protocolView setPrefixStr:@"这里是前缀"
                 suffixStr:@"这里是后缀哈哈哈"
             protocolArray:@[@{ProtocolViewNameKey:@"《这里是协议》",
                               ProtocolViewLinkKey:@"https://www.baidu.com"}]
                 textColor:[UIColor darkTextColor]
         protocolTextColor:[UIColor blueColor]
                  textFont:[UIFont systemFontOfSize:15]];
[self.view addSubview:protocolView];
protocolView.frame = CGRectMake(10, 100, 260, 10);
protocolView.jumpBlock = ^(NSString *urlStr) {
    NSLog(@"%@", urlStr);
};
```

![Demo](https://github.com/lengmolehongyan/LNProtocolView/blob/master/SimulatorScreenShot1.png)

## Requirements

## Installation

LNProtocolView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LNProtocolView"
```

## Author

lengmolehongyan, lengmohongyan@hotmail.com

## License

LNProtocolView is available under the MIT license. See the LICENSE file for more info.


//
//  LNViewController.m
//  LNProtocolView
//
//  Created by lengmolehongyan on 06/26/2017.
//  Copyright (c) 2017 lengmolehongyan. All rights reserved.
//

#import "LNViewController.h"
#import <LNProtocolView/LNProtocolView.h>

@interface LNViewController ()

@end

@implementation LNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self demoTest1];
    [self demoTest2];
    [self demoTest3];
    [self demoTest4];
    [self demoTest5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)demoTest1 {
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
}

- (void)demoTest2 {
    LNProtocolView *protocolView = [[LNProtocolView alloc] initWithFrame:CGRectZero];
    protocolView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [protocolView setPrefixStr:@"这里是前缀啊"
                     suffixStr:nil
                 protocolArray:@[@{ProtocolViewNameKey:@"《这里是协议》",
                                   ProtocolViewLinkKey:@"https://www.baidu.com"}]
                     textColor:[UIColor darkTextColor]
             protocolTextColor:[UIColor blueColor]
                      textFont:[UIFont systemFontOfSize:15]];
    [protocolView setNormalImgName:@"btn_select_no"
                     selectImgName:@"btn_select_yes"];
    [self.view addSubview:protocolView];
    protocolView.frame = CGRectMake(10, 150, 260, 10);
    protocolView.agreeBlock = ^(BOOL isAgree) {
        NSLog(@"%d", isAgree);
    };
    protocolView.jumpBlock = ^(NSString *urlStr) {
        NSLog(@"%@", urlStr);
    };
}

- (void)demoTest3 {
    LNProtocolView *protocolView = [[LNProtocolView alloc] initWithFrame:CGRectZero];
    protocolView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [protocolView setPrefixStr:@"这里是前缀"
                     suffixStr:@"这里是后缀哈哈哈哈哈哈哈哈"
                 protocolArray:@[@{ProtocolViewNameKey:@"《这里是协议》",
                                   ProtocolViewLinkKey:@"https://www.baidu.com"}]
                     textColor:[UIColor darkTextColor]
             protocolTextColor:[UIColor blueColor]
                      textFont:[UIFont systemFontOfSize:15]];
    [protocolView setNormalImgName:@"btn_select_no"
                     selectImgName:@"btn_select_yes"];
    [self.view addSubview:protocolView];
    protocolView.frame = CGRectMake(10, 200, 260, 10);
    protocolView.agreeBlock = ^(BOOL isAgree) {
        NSLog(@"%d", isAgree);
    };
    protocolView.jumpBlock = ^(NSString *urlStr) {
        NSLog(@"%@", urlStr);
    };
}

- (void)demoTest4 {
    LNProtocolView *protocolView = [[LNProtocolView alloc] initWithFrame:CGRectZero];
    protocolView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [protocolView setPrefixStr:@"这里是前缀哈哈哈哈哈哈哈哈哈哈"
                     suffixStr:@"这里是后缀"
                 protocolArray:@[@{ProtocolViewNameKey:@"《这里是协议》",
                                   ProtocolViewLinkKey:@"https://www.baidu.com"}]
                     textColor:[UIColor darkTextColor]
             protocolTextColor:[UIColor blueColor]
                      textFont:[UIFont systemFontOfSize:15]
                     alignment:NSTextAlignmentCenter];
    [self.view addSubview:protocolView];
    protocolView.frame = CGRectMake(10, 250, 260, 10);
    protocolView.jumpBlock = ^(NSString *urlStr) {
        NSLog(@"%@", urlStr);
    };
}

- (void)demoTest5 {
    LNProtocolView *protocolView = [[LNProtocolView alloc] initWithFrame:CGRectZero];
    protocolView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [protocolView setPrefixStr:@"这里是前缀哈哈哈哈哈哈哈哈哈哈"
                     suffixStr:@"这里是后缀"
                 protocolArray:@[@{ProtocolViewNameKey:@"《这里是协议》",
                                   ProtocolViewLinkKey:@"https://www.baidu.com"}]
                     textColor:[UIColor darkTextColor]
             protocolTextColor:[UIColor blueColor]
                      textFont:[UIFont systemFontOfSize:15]
                     alignment:NSTextAlignmentLeft
                 lineBreakMode:NSLineBreakByWordWrapping];
    [self.view addSubview:protocolView];
    protocolView.frame = CGRectMake(10, 300, 260, 10);
    protocolView.jumpBlock = ^(NSString *urlStr) {
        NSLog(@"%@", urlStr);
    };
}

@end

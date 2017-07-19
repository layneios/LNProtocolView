//
//  LNProtocolView.h
//  LNProtocolView
//
//  Created by lengmolehongyan on 06/26/2017.
//  Copyright (c) 2017 lengmolehongyan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 ProtocolView agreement button click event block.

 @param isAgree Yes or no.
 */
typedef void (^ProtocolAgreeBlock)(BOOL isAgree);

/**
 ProtocolView jump event block.

 @param urlStr Jump link, absoluteString.
 */
typedef void (^ProtocolJumpBlock)(NSString *urlStr);

/**
 Custom protocolView.
 */
@interface LNProtocolView : UIView

@property (nonatomic, copy) ProtocolAgreeBlock agreeBlock;
@property (nonatomic, copy) ProtocolJumpBlock jumpBlock;

/**
 ProtocolView total height.
 */
@property (nonatomic, assign) CGFloat protocolViewHeight;

- (void)setPrefixStr:(NSString *)prefixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont;

- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont;

- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont
           alignment:(NSTextAlignment)alignment;

/**
 Config protocolView with custom style.
 
 @param prefixStr           The beginning characters of the protocol string.
 @param suffixStr           The ending characters of the protocol string.
 @param protocolArray       See sample code.
 @param textColor           The protocol normal string text color.
 @param protocolTextColor   The protocol string text color.
 @param textFont            The protocol string font.
 @param alignment           The text alignment of the protocol string.
 @param lineBreakMode       The text lineBreakMode of the protocol string.
 @code @[@{ProtocolViewNameKey:@"ProtocolText",ProtocolViewLinkKey:@"http://www.test.com"}]
 */
- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont
           alignment:(NSTextAlignment)alignment
       lineBreakMode:(NSLineBreakMode)lineBreakMode;

/**
 Config selectBtn normal, select state image.
 */
- (void)setNormalImgName:(NSString *)normalImgName
           selectImgName:(NSString *)selectImgName;

@end

/**
 *  Protocol text name key.
 */
extern NSString * const ProtocolViewNameKey;

/**
 *  Protocol jump link key.
 */
extern NSString * const ProtocolViewLinkKey;

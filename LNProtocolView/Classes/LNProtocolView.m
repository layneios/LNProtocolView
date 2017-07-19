//
//  LNProtocolView.m
//  LNProtocolView
//
//  Created by lengmolehongyan on 06/26/2017.
//  Copyright (c) 2017 lengmolehongyan. All rights reserved.
//

#import "LNProtocolView.h"

NSString * const ProtocolViewNameKey = @"name";
NSString * const ProtocolViewLinkKey = @"link";

@interface LNProtocolView () <UITextViewDelegate>

@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UIButton *selectBtn;

@end

@implementation LNProtocolView

#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupProtocolViewSubViews];
    }
    return self;
}

- (void)setupProtocolViewSubViews {
    UIButton *selectBtn = [[UIButton alloc] init];
    selectBtn.adjustsImageWhenHighlighted = NO;
    selectBtn.adjustsImageWhenDisabled = NO;
    selectBtn.hidden = YES;
    self.selectBtn = selectBtn;
    selectBtn.layer.cornerRadius = 5.0;
    [selectBtn addTarget:self
                  action:@selector(protocolViewAgree:)
        forControlEvents:UIControlEventTouchUpInside];
    selectBtn.selected = YES;
    [self addSubview:selectBtn];

    UITextView *textView = [[UITextView alloc] init];
    self.textView = textView;
    textView.showsVerticalScrollIndicator = NO;
    textView.showsHorizontalScrollIndicator = NO;
    textView.scrollEnabled = NO;
    textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    textView.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] init];
    textView.attributedText = attrStr.copy;
    textView.dataDetectorTypes = UIDataDetectorTypeLink;
    textView.delegate = self;
    textView.editable = NO;
    [self addSubview:textView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnImgW = 0;
    CGFloat textViewX = 0;
    CGFloat textViewY = 0;
    CGFloat textViewW = self.bounds.size.width;
    CGFloat lineHeight = self.textView.font.lineHeight;
    if (!self.selectBtn.isHidden) {
        UIImage *img = self.selectBtn.currentImage;
        btnImgW = MIN(img.size.width, img.size.height);
        textViewX = btnImgW;
        CGFloat selectBtnY = 0;
        if (lineHeight >= btnImgW) {
            // fixed selectBtn Y
            selectBtnY = (lineHeight - btnImgW) / 2.0;
        } else {
            // fixed textView Y
            textViewY = (btnImgW - lineHeight) / 2.0;
        }
        textViewW -= btnImgW;
        self.selectBtn.frame = CGRectMake(0, selectBtnY, btnImgW, btnImgW);
    }
    [self updateProtocolViewHeightWithWidth:textViewW];
    CGFloat textViewH = self.protocolViewHeight;
    self.textView.frame = CGRectMake(textViewX,
                                     textViewY,
                                     textViewW,
                                     textViewH);
    if (CGRectGetMaxY(self.textView.frame) < btnImgW) {
        self.protocolViewHeight = btnImgW;
    } else {
        self.protocolViewHeight = textViewH + textViewY;
    }
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.protocolViewHeight);
}

#pragma mark - UpdateData
- (void)setNormalImgName:(NSString *)normalImgName
           selectImgName:(NSString *)selectImgName {
    self.selectBtn.hidden = NO;
    if (normalImgName) {
        [self.selectBtn setImage:[UIImage imageNamed:normalImgName]
                        forState:UIControlStateNormal];
    }
    if (selectImgName) {
        [self.selectBtn setImage:[UIImage imageNamed:selectImgName]
                        forState:UIControlStateSelected];
    }
}

- (void)setPrefixStr:(NSString *)prefixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont {
    [self setPrefixStr:prefixStr
             suffixStr:nil
         protocolArray:protocolArray
             textColor:textColor
     protocolTextColor:protocolTextColor
              textFont:textFont
             alignment:NSTextAlignmentLeft
         lineBreakMode:NSLineBreakByCharWrapping];
}

- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont {
    [self setPrefixStr:prefixStr
             suffixStr:suffixStr
         protocolArray:protocolArray
             textColor:textColor
     protocolTextColor:protocolTextColor
              textFont:textFont
             alignment:NSTextAlignmentLeft
         lineBreakMode:NSLineBreakByCharWrapping];
}

- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont
           alignment:(NSTextAlignment)alignment {
    [self setPrefixStr:prefixStr
             suffixStr:suffixStr
         protocolArray:protocolArray
             textColor:textColor
     protocolTextColor:protocolTextColor
              textFont:textFont
             alignment:alignment
         lineBreakMode:NSLineBreakByCharWrapping];
}

- (void)setPrefixStr:(NSString *)prefixStr
           suffixStr:(NSString *)suffixStr
       protocolArray:(NSArray<NSDictionary <NSString *, NSString *>*> *)protocolArray
           textColor:(UIColor *)textColor
   protocolTextColor:(UIColor *)protocolTextColor
            textFont:(UIFont *)textFont
           alignment:(NSTextAlignment)alignment
       lineBreakMode:(NSLineBreakMode)lineBreakMode {
    NSMutableArray *protocolStrArray = [NSMutableArray array];
    for (NSDictionary<NSString *, NSString *> *dict in protocolArray) {
        NSString *str = dict[ProtocolViewNameKey];
        [protocolStrArray addObject:str];
    }
    NSString *protocolString = [protocolStrArray.copy componentsJoinedByString:@","];
    NSString *totalString = [NSString stringWithFormat:@"%@%@%@", prefixStr ?: @"",
                             protocolString ?: @"",
                             suffixStr ?: @""];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    if (textColor) {
        [attrStr addAttribute:NSForegroundColorAttributeName
                        value:textColor
                        range:NSMakeRange(0, totalString.length)];
    }
    if (textFont) {
        [attrStr addAttribute:NSFontAttributeName
                        value:textFont
                        range:NSMakeRange(0, totalString.length)];
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = lineBreakMode;
    style.alignment = alignment;
    [attrStr addAttribute:NSParagraphStyleAttributeName
                    value:style.copy
                    range:NSMakeRange(0, totalString.length)];
    for (NSDictionary<NSString *, NSString *> *object in protocolArray) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = object;
            NSRange range = [totalString rangeOfString:dict[ProtocolViewNameKey]];
            if (range.location != NSNotFound) {
                NSString *urlString = dict[ProtocolViewLinkKey];
                if (urlString && (urlString.length > 0)) {
                    NSURL *url = [NSURL URLWithString:urlString];
                    if (url) {
                        [attrStr addAttribute:NSLinkAttributeName
                                        value:url
                                        range:range];
                    }
                }
            }
        }
    }
    if (protocolTextColor) {
        NSDictionary *linkAttributes = @{NSForegroundColorAttributeName : protocolTextColor};
        self.textView.linkTextAttributes = linkAttributes;
    }
    self.textView.attributedText = attrStr.copy;
}

- (void)updateProtocolViewHeightWithWidth:(CGFloat)width {
    CGSize resultSize = [self.textView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    self.protocolViewHeight = resultSize.height;
}

- (void)protocolViewAgree:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (self.agreeBlock) {
        self.agreeBlock(btn.isSelected);
    }
}

- (CGSize)ln_textSizeWithConstraintSize:(CGSize)constraintSize
                                   font:(UIFont *)font
                                 string:(NSString *)string {
    CGSize resultSize = CGSizeZero;
    resultSize = [string boundingRectWithSize:constraintSize
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName : font}
                                      context:nil].size;
    
    
    return resultSize;
}

#pragma mark - textViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL
         inRange:(NSRange)characterRange {
    if (URL) {
        if (self.jumpBlock) {
            self.jumpBlock(URL.absoluteString);
        }
        return NO;
    }
    return YES;
}

@end

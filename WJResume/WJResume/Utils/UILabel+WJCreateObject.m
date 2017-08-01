//
//  UILabel+Extension.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "UILabel+WJCreateObject.h"

@implementation UILabel (WJCreateObject)

#pragma mark use text create object

+ (instancetype)wj_labelWithText:(NSString *)text {
    return [self wj_labelWithText:text fontSize:14.f];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize {
    return [self wj_labelWithText:text fontSize:fontSize textColor:[UIColor darkGrayColor]];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor {
    return [self wj_labelWithText:text
                         fontSize:fontSize
                        textColor:textColor
                        alignment:NSTextAlignmentLeft];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                       alignment:(NSTextAlignment)alignment {
    return [self wj_labelWithText:text lines:1 fontSize:fontSize
                        textColor:textColor alignment:alignment];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines {
    return [self wj_labelWithText:text lines:lines fontSize:14.f];
}


+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize {
    return [self wj_labelWithText:text
                            lines:lines
                         fontSize:fontSize
                        textColor:[UIColor darkGrayColor]
                        alignment:NSTextAlignmentLeft];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor {
    return [self wj_labelWithText:text
                            lines:lines
                         fontSize:fontSize
                        textColor:textColor
                        alignment:NSTextAlignmentLeft];
}

+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                       alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = lines;
    label.textColor = textColor;
    label.textAlignment = alignment;
    return label;
}


#pragma mark dynamic create object

+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize {
    return [self wj_labelWithFontSize:fontSize textColor:[UIColor darkGrayColor]];
}


+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize
                           textColor:(UIColor *)textColor {
    return [self wj_labelWithFontSize:fontSize textColor:textColor alignment:NSTextAlignmentLeft];
}


+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize
                           textColor:(UIColor *)textColor
                           alignment:(NSTextAlignment)alignment {
    return [self wj_labelWithFontSize:fontSize lines:1 textColor:textColor alignment:alignment];
}


+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize
                               lines:(NSUInteger)lines {
    return [self wj_labelWithFontSize:fontSize lines:lines textColor:[UIColor darkGrayColor]];
}


+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize
                               lines:(NSUInteger)lines
                           textColor:(UIColor *)textColor {
    return [self wj_labelWithFontSize:fontSize
                                lines:lines
                            textColor:textColor
                            alignment:NSTextAlignmentLeft];
}


+ (instancetype)wj_labelWithFontSize:(CGFloat)fontSize
                               lines:(NSUInteger)lines
                           textColor:(UIColor *)textColor
                           alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = lines;
    label.textColor = textColor;
    label.textAlignment = alignment;
    return label;
}

@end

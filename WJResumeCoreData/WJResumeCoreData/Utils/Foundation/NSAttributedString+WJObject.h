//
//  NSAttributedString+WJObject.h

//
//  Created by William on 2016/4/12.
//  Copyright © 2016年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (WJObject)

/// 默认字体大小 14，默认字体颜色 darkGrayColor

#pragma mark - no paragraph style

/*
 * @param   text    字符串
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text;

/*
 * @param   text    字符串
 * @param   size    字体大小
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize;

/*
 * @param   text    字符串
 * @param   size    字体大小
 * @param   color   字体颜色
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                      textColor:(UIColor *)textColor;

#pragma mark - add paragraph style

+ (instancetype)wj_attrWithText:(NSString *)text
                    lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                    lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                    lineSpacing:(CGFloat)lineSpacing
                     headIndent:(CGFloat)headIndent;

@end

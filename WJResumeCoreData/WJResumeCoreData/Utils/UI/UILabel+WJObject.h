//
//  UILabel+WJObject.h
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WJObject)

#pragma mark - 

/// 默认字体大小 14，默认字体颜色 darkGrayColor，默认对齐方式 左对齐，默认行数 1

/*
 * @desc 实例化对象
 * @param text 字符串
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text;


/*
 * @desc 实例化对象
 * @param text 字符串
 * @param fontSize 字体大小
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize;

/*
 * @desc 实例化对象
 * @param text 字符串
 * @param fontSize 字体大小
 * @param textColor 字体颜色
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor;

/*
 * @desc 实例化对象
 * @param text 字符串
 * @param fontSize 字体大小
 * @param textColor 字体颜色
 * @param alignment 对齐方式
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                       alignment:(NSTextAlignment)alignment;

/*
 * @desc 实例化对象
 * @param text 字符串
 * @param lines 行数
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines;


/*
 * @desc 实例化对象
 * @param text 字符串
 * @param lines 行数
 * @param fontSize 字体大小
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize;

/*
 * @desc 实例化对象
 * @param text 字符串
 * @param lines 行数
 * @param fontSize 字体大小
 * @param textColor 字体颜色
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor;

/*
 * @desc 实例化对象
 * @param text 字符串
 * @param lines 行数
 * @param fontSize 字体大小
 * @param textColor 字体颜色
 * @param alignment 对齐方式
 * @return 返回实例化对象
 */
+ (instancetype)wj_labelWithText:(NSString *)text
                           lines:(NSUInteger)lines
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                       alignment:(NSTextAlignment)alignment;


#pragma mark - dynamic calculate content

+ (instancetype)wj_labelWithFontSize:(CGFloat)size;


+ (instancetype)wj_labelWithFontSize:(CGFloat)size
                           textColor:(UIColor *)textColor;

+ (instancetype)wj_labelWithFontSize:(CGFloat)size
                           textColor:(UIColor *)textColor
                           alignment:(NSTextAlignment)alignment;


+ (instancetype)wj_labelWithFontSize:(CGFloat)size
                               lines:(NSUInteger)lines;

+ (instancetype)wj_labelWithFontSize:(CGFloat)size
                               lines:(NSUInteger)lines
                           textColor:(UIColor *)textColor;

+ (instancetype)wj_labelWithFontSize:(CGFloat)size
                               lines:(NSUInteger)lines
                           textColor:(UIColor *)textColor
                           alignment:(NSTextAlignment)alignment;

@end

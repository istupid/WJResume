//
//  NSString+WJCalculate.h

//
//  Created by William on 2016/4/12.
//  Copyright © 2016年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (WJCalculate)

#pragma mark - calculate string height

/**
 *  @param width frame size width
 *
 */
- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width;

- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                              fontSize:(CGFloat)fontSize
                            familyName:(NSString *)familyName;

- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                           fontSize:(CGFloat)fontSize
                        lineSpacing:(CGFloat)lineSpacing;

- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                              fontSize:(CGFloat)fontSize
                            familyName:(NSString *)familyName
                           lineSpacing:(CGFloat)lineSpacing;

#pragma mark - single row or multiple rows

/**
 *  @param width frame size width
 *
 *  @return single row YES or multiple row NO
 */
- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width;

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width
                       fontSize:(CGFloat)fontSize
                     familyName:(NSString *)familyName;

- (BOOL)wj_containChinese;

@end

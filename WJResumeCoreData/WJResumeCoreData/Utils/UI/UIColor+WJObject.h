//
//  UIColor+WJObject.h
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WJObject)

/**
 *  @param red      red number 1 to 256
 *  @param green    green number 1 to 256
 *  @param blue     blue number 1 to 256
 *  @return UIColor
 */
+ (instancetype)wj_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue;

@end

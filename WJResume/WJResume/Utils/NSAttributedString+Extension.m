//
//  NSAttributedString+Extension.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

#pragma mark - no paragraph style

+ (instancetype)wj_attrWithText:(NSString *)text {
    return [self wj_attrWithText:text fontSize:14.f];
}


+ (instancetype)wj_attrWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self wj_attrWithText:text fontSize:fontSize textColor:[UIColor darkGrayColor]];
}


+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                      textColor:(UIColor *)textColor {
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName: textColor
                                 };
    return [self wj_attrWithText:text attributes:attributes];
}

#pragma mark - add paragraph style

+ (instancetype)wj_attrWithText:(NSString *)text
                    lineSpacing:(CGFloat)lineSpacing {
    return [self wj_attrWithText:text fontSize:14.f lineSpacing:lineSpacing];
}


+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                    lineSpacing:(CGFloat)lineSpacing {

    return [self wj_attrWithText:text
                        fontSize:fontSize
                       textColor:[UIColor darkGrayColor]
                     lineSpacing:lineSpacing];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName: textColor,
                                 NSParagraphStyleAttributeName:paragraph
                                 };

    return [self wj_attrWithText:text attributes:attributes];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                    lineSpacing:(CGFloat)lineSpacing
                     headIndent:(CGFloat)headIndent {
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.firstLineHeadIndent = headIndent;
    paragraph.headIndent = headIndent;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [self wj_attrWithText:text attributes:attributes];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                       fontSize:(CGFloat)fontSize
                    lineSpacing:(CGFloat)lineSpacing
            firstLineHeadIndent:(CGFloat)firstLineHeadIndent
                     headIndent:(CGFloat)headIndent {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.firstLineHeadIndent = firstLineHeadIndent;
    paragraph.headIndent = headIndent;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [self wj_attrWithText:text attributes:attributes];
}

#pragma mark - all method call

+ (instancetype)wj_attrWithText:(NSString *)text attributes:(NSDictionary *)attributes {
    return [[self alloc] initWithString:text attributes:attributes];
}

@end

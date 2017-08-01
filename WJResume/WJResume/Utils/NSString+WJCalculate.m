//
//  NSString+WJCalculate.m
//  WJResume
//
//  Created by William on 2017/7/20.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NSString+WJCalculate.h"

@implementation NSString (WJCalculate)

- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width {
    
    return [self wj_calculateHeightWithWidth:width attributes:nil];
}


- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize {
    
    return [self wj_calculateHeightWithWidth:width attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
}


- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                              fontSize:(CGFloat)fontSize
                            familyName:(NSString *)familyName {
    
    return [self wj_calculateHeightWithWidth:width attributes:@{NSFontAttributeName:[UIFont fontWithName:familyName size:fontSize]}];
}


- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                              fontSize:(CGFloat)fontSize
                           lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                 NSParagraphStyleAttributeName : paragraph};
    
    return [self wj_calculateHeightWithWidth:width attributes:attributes];
}


- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width
                              fontSize:(CGFloat)fontSize
                            familyName:(NSString *)familyName
                           lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:familyName size:fontSize],
                                 NSParagraphStyleAttributeName : paragraph};
    
    return [self wj_calculateHeightWithWidth:width attributes:attributes];
}


// 私有方法
- (CGFloat)wj_calculateHeightWithWidth:(CGFloat)width attributes:(NSDictionary *)attributes {
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    return [self boundingRectWithSize:size options:options attributes:attributes context:nil].size.height;
}

#pragma mark - single row or multiple rows

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width {
    return [self wj_isSingleRowWithWidth:width attributes:nil];
}

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize {
    
    return [self wj_isSingleRowWithWidth:width attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
}

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width
                       fontSize:(CGFloat)fontSize
                     familyName:(NSString *)familyName {
    
    return [self wj_isSingleRowWithWidth:width attributes:@{NSFontAttributeName:[UIFont fontWithName:familyName size:fontSize]}];
}

- (BOOL)wj_isSingleRowWithWidth:(CGFloat)width attributes:(NSDictionary *)attributes {
    
    CGFloat height = [self wj_calculateHeightWithWidth:width attributes:attributes];
    
    UIFont *font = attributes[NSFontAttributeName];
    
    if (height - font.lineHeight < font.lineHeight) {
        if ([self wj_containChinese]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)wj_containChinese {
    for (NSUInteger i = 0; i < self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if (c > 0x4E00 && c < 0x9FFF) {
            return YES;
        }
    }
    return NO;
}


@end

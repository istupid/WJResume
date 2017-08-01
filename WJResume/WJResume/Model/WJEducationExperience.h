//
//  WJEducationInfo.h
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJEducationExperience : NSObject

// 学校
@property (nonatomic, copy) NSString *name;

// 学位
@property (nonatomic, copy) NSString *degree;

// 专业
@property (nonatomic, copy) NSString *major;

// 毕业年限
@property (nonatomic, copy) NSString *graduationYear;


@end

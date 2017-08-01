//
//  WJWorkExperienceInfo.h
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJWorkExperience : NSObject

// 公司名称
@property (nonatomic, copy) NSString *name;

// 岗位
@property (nonatomic, copy) NSString *post;

// 时间
@property (nonatomic, copy) NSString *time;

@end

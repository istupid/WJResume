//
//  WJProjectExperience.h
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WJDescMsg.h"

@interface WJProjectExperience : NSObject

// 项目名称
@property (nonatomic, copy) NSString *name;

// 项目描述
@property (nonatomic, copy) NSString *desc;

// 时间
@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSArray<WJDescMsg *> *skills;



@end

//
//  WJPerson.h
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WJPersonInfo.h"
#import "WJWorkExperience.h"
#import "WJEducationExperience.h"
#import "WJProjectExperience.h"
#import "WJDescMsg.h"

@interface WJResume : NSObject

@property (nonatomic, strong) WJPersonInfo *personInfo;

@property (nonatomic, copy) NSArray<WJWorkExperience *> *workExpers;

@property (nonatomic, copy) NSArray<WJEducationExperience *> *edusInfo;

@property (nonatomic, copy) NSArray<WJProjectExperience *> *proExpers;

@property (nonatomic, copy) NSArray<WJDescMsg *> *classSkills;

@property (nonatomic, copy) NSArray<WJDescMsg *> *personals;

@end

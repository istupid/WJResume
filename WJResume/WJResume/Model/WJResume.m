//
//  WJPerson.m
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResume.h"

@implementation WJResume

- (void)setPersonInfo:(WJPersonInfo *)personInfo {
    if ([personInfo isKindOfClass:NSDictionary.class]) {
       personInfo = [WJPersonInfo modelWithDictionary:(NSDictionary *)personInfo];
    }
    _personInfo = personInfo;
}

- (void)setWorkExpers:(NSArray<WJWorkExperience *> *)workExpers {
    if ([workExpers isKindOfClass:NSArray.class]) {
        NSMutableArray<WJWorkExperience *> *expers = [NSMutableArray arrayWithArray:workExpers];
        [expers enumerateObjectsUsingBlock:^(WJWorkExperience * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJWorkExperience modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        workExpers = expers.copy;
    }
    _workExpers = workExpers;
}

- (void)setEdusInfo:(NSArray<WJEducationExperience *> *)edusInfo {
    if ([edusInfo isKindOfClass:NSArray.class]) {
        NSMutableArray<WJEducationExperience *> *expers = [NSMutableArray arrayWithArray:edusInfo];
        [expers enumerateObjectsUsingBlock:^(WJEducationExperience * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJEducationExperience modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        edusInfo = expers.copy;
    }
    _edusInfo = edusInfo;
}

- (void)setProExpers:(NSArray<WJProjectExperience *> *)proExpers {
    if ([proExpers isKindOfClass:NSArray.class]) {
        NSMutableArray<WJProjectExperience *> *expers = [NSMutableArray arrayWithArray:proExpers];
        [expers enumerateObjectsUsingBlock:^(WJProjectExperience * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJProjectExperience modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        proExpers = expers.copy;
    }
    _proExpers = proExpers;
}

- (void)setClassSkills:(NSArray<WJDescMsg *> *)classSkills {
    if ([classSkills isKindOfClass:NSArray.class]) {
        NSMutableArray<WJDescMsg *> *expers = [NSMutableArray arrayWithArray:classSkills];
        [expers enumerateObjectsUsingBlock:^(WJDescMsg * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJDescMsg modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        classSkills = expers.copy;
    }
    _classSkills = classSkills;
}

- (void)setPersonals:(NSArray<WJDescMsg *> *)personals {
    if ([personals isKindOfClass:NSArray.class]) {
        NSMutableArray<WJDescMsg *> *expers = [NSMutableArray arrayWithArray:personals];
        [expers enumerateObjectsUsingBlock:^(WJDescMsg * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJDescMsg modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        personals = expers.copy;
    }
    _personals = personals;
}

@end

//
//  WJTableViewDataSource.h
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person+CoreDataClass.h"

@interface WJResumeDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) Person *person;

+ (instancetype)resumeDataSourceWithTableView:(UITableView *)tableView;

@end

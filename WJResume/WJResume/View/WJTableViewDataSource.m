//
//  WJTableViewDataSource.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJTableViewDataSource.h"
#import "UITableViewCell+Extension.h"

@interface WJTableViewDataSource ()

@property (nonatomic, copy) NSDictionary *dict;

@end

@implementation WJTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.resumeData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.resumeData[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id objc = self.resumeData[indexPath.section][indexPath.row];
    
    NSString *model = NSStringFromClass([objc class]);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.dict[model] forIndexPath:indexPath];
    
    cell.objc = objc;
    
    return cell;
}

#pragma mark - 
- (NSDictionary *)dict {
    if (!_dict) {
        _dict = @{@"WJPersonInfo":@"WJPersonInfoCell",@"WJWorkExperience":@"WJExperienceCell",
                  @"WJEducationExperience":@"WJExperienceCell",@"WJProjectExperience":@"WJExperienceCell",@"WJDescMsg":@"WJDescMsgCell"};
    }
    return _dict;
}

@end

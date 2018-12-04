//
//  WJTableViewDataSource.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeDataSource.h"
#import "Project+CoreDataClass.h"

@interface WJResumeDataSource ()

@property (nonatomic, copy) NSDictionary *dict;

@property (nonatomic, copy) NSArray *dataArr;

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WJResumeDataSource

+ (instancetype)resumeDataSourceWithTableView:(UITableView *)tableView {
    
    [tableView registerClass:_Class_(@"WJResumeCell") forCellReuseIdentifier:@"WJResumeCell"];
    [tableView registerClass:_Class_(@"WJExperienceCell") forCellReuseIdentifier:@"WJExperienceCell"];
    [tableView registerClass:_Class_(@"WJDescMsgCell") forCellReuseIdentifier:@"WJDescMsgCell"];
    [tableView registerClass:_Class_(@"WJHeadView") forHeaderFooterViewReuseIdentifier:@"WJHeadView"];
    
    
    tableView.estimatedRowHeight = 60;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    tableView.estimatedSectionHeaderHeight = 50;
    tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.allowsSelection = NO;
    
    WJResumeDataSource *dataSource = [[self alloc] init];
    
    dataSource.tableView = tableView;
    
    return dataSource;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.dataArr[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id objc = self.dataArr[indexPath.section][indexPath.row];
    
    NSString *model = NSStringFromClass([objc class]);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.dict[model] forIndexPath:indexPath];
    
    [cell setValue:objc forKey:@"objc"];
    
    return cell;
}

#pragma mark - 
- (NSDictionary *)dict {
    if (!_dict) {
        _dict = @{@"Person":@"WJResumeCell", @"Job":@"WJExperienceCell",
                  @"Education":@"WJExperienceCell", @"Project":@"WJExperienceCell",
                  @"ProjectSkill":@"WJDescMsgCell", @"ClassSkill":@"WJDescMsgCell",
                  @"Personal":@"WJDescMsgCell"};
    }
    return _dict;
}

- (void)setPerson:(Person *)person {
    _person = person;
    NSSortDescriptor *ascSort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    NSSortDescriptor *descSort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:NO];
    
    NSSet *jobSet = person.jobs;
    NSArray *jobs = [jobSet sortedArrayUsingDescriptors:@[descSort]];
    
    NSSet *eduSet = person.educations;
    NSArray *educations = [eduSet sortedArrayUsingDescriptors:@[descSort]];
    
    NSSet *projectSet = person.projects;
    NSArray *projects = [projectSet sortedArrayUsingDescriptors:@[descSort]];
    NSMutableArray *mArray = [NSMutableArray array];
    for (Project *pro in projects) {
        [mArray addObject:pro];
        NSSet *set = pro.skills;
        NSArray *array = [set sortedArrayUsingDescriptors:@[ascSort]];
        for (id objc in array) {
            [mArray addObject:objc];
        }
    }
    NSArray *experiences = mArray.copy;
    
    NSSet *classSKillSet = person.classSkills;
    NSArray *classSkills = [classSKillSet sortedArrayUsingDescriptors:@[ascSort]];
    
    NSSet *personalSet = person.personals;
    NSArray *personals = [personalSet sortedArrayUsingDescriptors:@[ascSort]];
    
    _dataArr = @[@[person], jobs, educations, experiences, classSkills, personals];
    
    [_tableView reloadData];
}

@end

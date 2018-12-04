//
//  WJResumeController.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeController.h"
#import "WJResumeDataSource.h"
#import "WJResumeDelegate.h"

@implementation WJResumeController {
    UITableView *_tableView;
    WJResumeDelegate *_delegate;
    WJResumeDataSource *_dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    
    _dataSource = [WJResumeDataSource resumeDataSourceWithTableView:_tableView];
    _delegate = [[WJResumeDelegate alloc] init];
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _delegate;
}

- (void)setPerson:(Person *)person {
    _person = person;
    _dataSource.person = person;
}

@end

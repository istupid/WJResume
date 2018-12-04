//
//  WJHomeController.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJHomeController.h"
#import "WJResumeController.h"
#import "WJTestData.h"

@interface WJHomeController ()

@property (nonatomic, strong) NSArray<Person *> *persons;

@end

@implementation WJHomeController {
    UIImageView *_imageView;
    UIButton    *_btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // s首次装载数据
    [[WJTestData alloc] init];
    
    [self setUI];
    [self setComponent];
}

- (void)setUI {
    UIImage *image = [UIImage imageNamed:@"person"];
    _imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:_imageView];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_btn];
    
    [_btn setTitle:@"点击查看简历" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setComponent {
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(10);
        make.centerX.equalTo(_imageView.mas_centerX);
    }];
}

#pragma mark - 事件响应
- (void)btnClick {
    WJResumeController *resume = [[WJResumeController alloc] init];
    resume.view.backgroundColor = [UIColor whiteColor];
    resume.person = self.persons.firstObject;
    [self presentViewController:resume animated:YES completion:nil];
}

#pragma mark - 数据加载

- (NSArray<Person *> *)persons {
    if (!_persons) {
        _persons = [NSArray array];
        NSFetchRequest *request = [Person fetchRequest];
        request.predicate = [NSPredicate predicateWithFormat:@"name = 'xiongchun'"];
        NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        request.sortDescriptors = @[sortDesc];
        
        NSArray <Person *> *persons = [[WJCoreDataManager sharedInstance].context executeFetchRequest:request error:nil];
        _persons = persons;
    }
    return _persons;
}


@end

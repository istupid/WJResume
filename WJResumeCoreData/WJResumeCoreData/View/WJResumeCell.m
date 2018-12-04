//
//  WJResumeCell.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeCell.h"
#import "Masonry.h"
#import "Person+CoreDataClass.h"
#import "Education+CoreDataClass.h"
#import "Job+CoreDataClass.h"
#import "UIImage+WJGraphics.h"

@implementation WJResumeCell {
    UILabel *_titleLabel;
    UILabel *_descLabel;
    UILabel *_professionLabel;
    UILabel *_addrLabel;
    UILabel *_phoneLabel;
    UILabel *_emailLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setComponent];
    }
    return self;
}

- (void)setUI {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    _descLabel = [[UILabel alloc] init];
    _descLabel.textAlignment = NSTextAlignmentCenter;
    _descLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_descLabel];
    
    _professionLabel = [[UILabel alloc] init];
    _professionLabel.textAlignment = NSTextAlignmentCenter;
    _professionLabel.font = [UIFont systemFontOfSize:12];
    _professionLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_professionLabel];
    
    _addrLabel = [[UILabel alloc] init];
    _addrLabel.numberOfLines = 0;
    _addrLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_addrLabel];
    
    _phoneLabel = [[UILabel alloc] init];
    _phoneLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_phoneLabel];
}

- (void)setComponent {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [_professionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [_addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_professionLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addrLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}


- (void)setObjc:(id)objc {
    Person *per = (Person *)objc;
    
    NSSortDescriptor *descSort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:NO];
    
    NSSet <Job *>*jobSet = per.jobs;
    Job *job = [jobSet sortedArrayUsingDescriptors:@[descSort]].firstObject;
    
    NSSet <Education *>*eduSet = per.educations;
    Education *edu = [eduSet sortedArrayUsingDescriptors:@[descSort]].firstObject;
    
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", per.phone] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage wj_rectImageWithSize:CGSizeMake(20, 12) fileColor:[UIColor grayColor]];
    attach.bounds = CGRectMake(0, 0, 20, 12);
    NSAttributedString *iconStr = [NSAttributedString attributedStringWithAttachment:attach];
    [attrStr appendAttributedString:iconStr];
    
    NSAttributedString *emailStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", per.email] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [attrStr appendAttributedString:emailStr];
    
#pragma mark 
    NSMutableAttributedString *addrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", per.gander ? @"男" : @"女"] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [addrStr appendAttributedString:iconStr];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *data = [dateFormatter dateFromString:per.birthday];
    
    NSDate *nowData = [NSDate date];
    NSDateFormatter *year = [[NSDateFormatter alloc] init];
    year.dateFormat = @"yyyy";
    
    int num = [[year stringFromDate:nowData] intValue] - [[year stringFromDate:data] intValue];
    
    NSAttributedString *birth = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%zd岁", num] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [addrStr appendAttributedString:birth];
    [addrStr appendAttributedString:iconStr];
    
    NSAttributedString *prefession = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", edu.type ? @"专科" : @"本科"] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [addrStr appendAttributedString:prefession];
    [addrStr appendAttributedString:iconStr];
    
    NSAttributedString *exp = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@年工作经验", per.experience] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [addrStr appendAttributedString:exp];
    [addrStr appendAttributedString:iconStr];
    
    NSAttributedString *address = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", per.addr] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 12], NSForegroundColorAttributeName: [UIColor grayColor]}];
    [addrStr appendAttributedString:address];
    
    _titleLabel.text = per.name;
    _descLabel.text = per.desc;
    _professionLabel.text = [NSString stringWithFormat:@"%@ · %@", per.profession, job.company];
    [_addrLabel setAttributedText:addrStr];
    [_phoneLabel setAttributedText:attrStr];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  WJExperienceCell.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJExperienceCell.h"

#import "Job+CoreDataClass.h"
#import "Education+CoreDataClass.h"
#import "Project+CoreDataClass.h"

#define kPaddingL 40
#define kPaddingA 10
#define kTimeW 100
#define kDescLableW (kScreenW - kPaddingL - 2 * kPaddingA - kTimeW)

@interface WJExperienceCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation WJExperienceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setComponent];
    }
    return self;
}

- (void)setUI {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    [self.contentView addSubview:self.titleLabel];
    
    _descLabel = [UILabel wj_labelWithFontSize:12 lines:0 textColor:[UIColor grayColor]];
    [self.contentView addSubview:_descLabel];
    
    _timeLabel = [UILabel wj_labelWithFontSize:12 textColor:[UIColor grayColor]];
    [self.contentView addSubview:self.timeLabel];
    
}

- (void)setComponent {
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(kPaddingA);
        make.leading.equalTo(self.contentView).offset(kPaddingL);
        make.trailing.equalTo(self.contentView).offset(-kPaddingA);
    }];
    
    [self.descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(kPaddingA);
        make.leading.equalTo(self.contentView).offset(kPaddingL);
    }];
    
    [self.timeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.descLabel.trailing).offset(kPaddingA);
        make.bottom.equalTo(self.descLabel);
        make.trailing.equalTo(self.contentView).offset(-kPaddingA);
        make.bottom.equalTo(self.contentView.bottom).offset(-kPaddingA);
        make.width.equalTo(kTimeW);
    }];
}

- (void)setObjc:(id)objc {
    if ([objc class] == Job.class) {
        self.titleLabel.text = ((Job *)objc).company;
        self.descLabel.text = ((Job *)objc).position;
        self.timeLabel.text = ((Job *)objc).time;
    }
    else if ([objc class] == Education.class) {
        self.titleLabel.text = ((Education *)objc).name;
        self.descLabel.text = [NSString stringWithFormat:@"%@ · %@", ((Education *)objc).type == 0 ? @"本科" : @"专科", ((Education *)objc).major ];
        self.timeLabel.text = ((Education *)objc).endYear;
    }
    else if ([objc class] == Project.class) {
        self.titleLabel.text = ((Project *)objc).name;
        NSString *text = ((Project *)objc).desc;
        if ([text wj_isSingleRowWithWidth:kDescLableW fontSize:12.f]) {
            _descLabel.text = text;
        } else {
            _descLabel.attributedText = [NSAttributedString wj_attrWithText:text fontSize:12.f textColor:[UIColor grayColor] lineSpacing:10.f];
        }
        self.timeLabel.text = ((Project *)objc).time;
    }
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

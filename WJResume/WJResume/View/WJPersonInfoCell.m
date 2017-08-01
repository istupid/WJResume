//
//  WJResumeCell.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJPersonInfoCell.h"
#import "WJPersonInfo.h"

@implementation WJPersonInfoCell {
    UILabel *_titleLabel;
    UILabel *_descLabel;
    UILabel *_professionLabel;
    UILabel *_ganderLabel;
    UILabel *_phoneLabel;
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
    
    _descLabel = [UILabel wj_labelWithFontSize:14.f
                                     textColor:[UIColor blackColor]
                                     alignment:NSTextAlignmentCenter];
    [self.contentView addSubview:_descLabel];
    
    _professionLabel = [UILabel wj_labelWithFontSize:12.f
                                           textColor:[UIColor grayColor]
                                           alignment:NSTextAlignmentCenter];
    [self.contentView addSubview:_professionLabel];
    
    _ganderLabel = [[UILabel alloc] init];
    _ganderLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_ganderLabel];
    
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
    
    [_ganderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_professionLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ganderLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}

- (void)setObjc:(id)objc {
    WJPersonInfo *person = (WJPersonInfo *)objc;
    
    UIImage *image = [UIImage wj_rectImageWithSize:CGSizeMake(20, 12) fileColor:[UIColor grayColor]];
    
    NSMutableAttributedString *phone = [NSMutableAttributedString wj_appendArray:@[person.phone, person.email] split:image fontSize:12.f textColor:[UIColor grayColor]];

    NSMutableAttributedString *gander = [NSMutableAttributedString wj_appendArray:@[person.gander, person.age, person.degree, person.experience, person.addr] split:image fontSize:12.f textColor:[UIColor grayColor]];
    
    _titleLabel.text = person.name;
    _descLabel.text = person.desc;
    _professionLabel.text = [NSString stringWithFormat:@"%@ · %@", person.profession, person.lastJob];
    _ganderLabel.attributedText = gander;
    _phoneLabel.attributedText = phone;
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

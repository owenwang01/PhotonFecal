//
//  HTSwitchLanguageCell.m
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTSwitchLanguageCell.h"

@interface HTSwitchLanguageCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *var_subTitlesL;

@end

@implementation HTSwitchLanguageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self ht_addSubviews];
    }
    return self;
}

- (void)ht_addSubviews {

    self.backgroundColor = [UIColor clearColor];
    
    self.imageV = [[UIImageView alloc] init];
    [self.imageV sd_setImageWithURL:kImageNumber(212)];
    [self.contentView addSubview:self.imageV];
    
    self.var_subTitlesL = [[UILabel alloc] init];
    self.var_subTitlesL.text = AsciiString(@"chinese-chinese simplified");
    self.var_subTitlesL.textColor = [UIColor whiteColor];
    self.var_subTitlesL.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.var_subTitlesL];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    [self.var_subTitlesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.imageV.mas_trailing).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView).inset(24);
    }];
}

- (void)switchLanguageCellSelected:(BOOL)isSelected {
    if (isSelected) {
        self.imageV.hidden = NO;
        self.var_subTitlesL.textColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    } else {
        self.imageV.hidden = YES;
        self.var_subTitlesL.textColor = [UIColor whiteColor];
    }
}

- (void)setCellText:(NSString *)cellText {
    self.var_subTitlesL.text = cellText;
}

@end

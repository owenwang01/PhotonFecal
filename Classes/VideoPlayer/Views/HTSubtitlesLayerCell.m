//
//  HTSubtitlesLayerCell.m
// 
//
//  Created by dn on 2023/1/29.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTSubtitlesLayerCell.h"

@interface HTSubtitlesLayerCell ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *var_subTitlesL;
@end

@implementation HTSubtitlesLayerCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self ht_addSubviews];
    }
    
    return self;
}

- (void)ht_addSubviews {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageV];
    
    self.var_subTitlesL = [[UILabel alloc] init];
    self.var_subTitlesL.text = LocalString(@"Adjust subtitle time", nil);
    self.var_subTitlesL.textColor = [UIColor whiteColor];
    self.var_subTitlesL.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.var_subTitlesL];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    [self.var_subTitlesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.imageV.mas_trailing).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView).inset(24);
    }];
}

- (void)setSubTitleText:(NSString *)subTitleText {
    if (subTitleText.length > 0) {
        self.var_subTitlesL.text = subTitleText;
    }
}

- (void)setCellImgName:(id)cellImgName {
    if (cellImgName != nil) {
        if([cellImgName isKindOfClass:[UIImage class]]) {
            self.imageV.image = cellImgName;
        } else if([cellImgName isKindOfClass:[NSString class]]) {
            self.imageV.image = [UIImage imageNamed:cellImgName];
        } else if([cellImgName isKindOfClass:[NSURL class]]) {
            [self.imageV sd_setImageWithURL:cellImgName];
        }
    }
}

@end

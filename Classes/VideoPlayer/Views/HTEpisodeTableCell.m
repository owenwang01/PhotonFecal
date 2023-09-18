//
//  HTEpisodeTableCell.m
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTEpisodeTableCell.h"
#import "HTEpisodeCellManager.h"

@interface HTEpisodeTableCell ()
@property (nonatomic, strong) UIView *backV;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *descriptionL;
@end

@implementation HTEpisodeTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self ht_addSubviews];
    }
    
    return self;
}

- (void)ht_addSubviews {
    
    self.backgroundColor = [UIColor clearColor];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    self.backV = [HTEpisodeCellManager lgjeropj_backView];
    [self.contentView addSubview:self.backV];
    
    self.titleL = [HTEpisodeCellManager lgjeropj_titleLabel];
    [self.backV addSubview:self.titleL];
    
    self.descriptionL = [HTEpisodeCellManager lgjeropj_descriptionLabel];
    [self.backV addSubview:self.descriptionL];
    
    [self.backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.leading.trailing.bottom.mas_equalTo(self.contentView);
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.backV).offset(16);
        make.top.mas_equalTo(self.backV).offset(10);
        make.height.mas_equalTo(19);
    }];
    
    [self.descriptionL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.titleL);
        make.trailing.mas_equalTo(self.backV).inset(15);
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(4);
        make.bottom.mas_equalTo(self.backV).inset(11);
    }];
}

- (void)ht_updateCellWithData:(HTTVPlayDetailEpsListModel *)data {
    self.titleL.text = [NSString stringWithFormat:@"%@ %@", LocalString(@"EPS", nil), data.eps_num];
    self.descriptionL.text = data.title;
}

- (void)lgjeropj_setCellTextColor:(BOOL)isSelected {
    if (isSelected) {
        self.titleL.textColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
        self.descriptionL.textColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    } else {
        self.titleL.textColor = [UIColor whiteColor];
        self.descriptionL.textColor = [UIColor whiteColor];
    }
}

@end

//
//  HTMovieHeaderCollectionCell.m
// 
//
//  Created by Apple on 2023/3/3.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTMovieHeaderCollectionCell.h"
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "HTMoviePlayDetailModel.h"
#import "HTMovieHeaderCellManager.h"

@interface HTMovieHeaderCollectionCell ()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIView *starContentV;
@property (nonatomic, strong) UILabel *scoreL;
@property (nonatomic, strong) UILabel *locationL;
@property (nonatomic, strong) UILabel *filmTypeL;
@property (nonatomic, strong) UILabel *infoL;
@property (nonatomic, strong) UILabel *infoContentL;
@property (nonatomic, strong) HCSStarRatingView *starrView;
@property (nonatomic, strong) UIButton *downArrowButton;
@property (nonatomic, assign) BOOL var_isDown;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *watchLaterButton;

@end

@implementation HTMovieHeaderCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self ht_addCellSubViews];
    }
    return self;
}

- (void)ht_addCellSubViews {
    
    [self setUserInteractionEnabled:YES];
    
    self.titleL = [HTMovieHeaderCellManager lgjeropj_titleLabel];
    [self addSubview:self.titleL];
    
    self.starContentV = [HTMovieHeaderCellManager lgjeropj_starContentView];
    [self addSubview:self.starContentV];
    
    self.scoreL = [HTMovieHeaderCellManager lgjeropj_scoreLabel];
    [self.starContentV addSubview:self.scoreL];
    
    self.locationL = [HTMovieHeaderCellManager lgjeropj_locationLabel];
    [self addSubview:self.locationL];
    
    self.filmTypeL = [HTMovieHeaderCellManager lgjeropj_filmTypeLabel];
    [self addSubview:self.filmTypeL];
        
    self.infoL = [HTMovieHeaderCellManager lgjeropj_infoLabel];
    [self addSubview:self.infoL];
    
    self.infoContentL = [HTMovieHeaderCellManager lgjeropj_infoContentLabel];
    [self addSubview:self.infoContentL];
    
    self.downArrowButton = [HTMovieHeaderCellManager lgjeropj_downArrowButton];
    [self.downArrowButton addTarget:self action:@selector(ht_downArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.downArrowButton];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(14);
        make.trailing.mas_equalTo(self).inset(44);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(21);
    }];
    
    [self.starContentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(140, 20));
    }];
    
    [self.scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.mas_equalTo(self.starContentV);
        make.centerY.equalTo(self.starContentV.mas_centerY);
    }];
    
    [self.locationL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.starContentV.mas_bottom).offset(16);
        make.height.mas_equalTo(16);
    }];
    
    [self.filmTypeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.locationL.mas_bottom).offset(6);
    }];
        
    self.starrView = [HTMovieHeaderCellManager lgjeropj_starView];
    [self.starContentV addSubview:self.starrView];
    
    [self.downArrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.starContentV.mas_centerY);
    }];
        
    [self.infoL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.filmTypeL.mas_bottom).offset(14);
        make.height.mas_offset(18);
    }];
    
    [self.infoContentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.infoL.mas_bottom).offset(6);
    }];
    
    self.bottomView = [HTMovieHeaderCellManager lgjeropj_bottomView];
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(120);
    }];
    NSArray *imageArray = @[kImageNumber(66), kImageNumber(160), kImageNumber(100)];
    NSMutableArray *buttonArray = @[].mutableCopy;
    for (int i = 0; i < imageArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button sd_setImageWithURL:imageArray[i] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.bottomView addSubview:button];
        [buttonArray addObject:button];
        button.tag = i;
        [button addTarget:self action:@selector(ht_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        if(i == 0){
            self.watchLaterButton = button;
        }
    }
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:14 tailSpacing:0];
    [buttonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0.0);
        make.height.equalTo(@30.0);
    }];
}

- (void)ht_buttonAction:(UIButton *)sender{
    if(self.BLOCK_operationButtonBlock){
        self.BLOCK_operationButtonBlock(sender);
    }
}

- (void)ht_updateViewWithData:(HTMoviePlayDetailModel *)data {
    HTHistoryData *historyData = HTCommonConfiguration.lgjeropj_shared.BLOCK_watchLaterSearchVideoByVideoIdBlock(data.var_idNum);
    //获取第一个button
    if(historyData){
        [self.watchLaterButton sd_setImageWithURL:kImageNumber(276) forState:UIControlStateNormal];
    }else{
        [self.watchLaterButton sd_setImageWithURL:kImageNumber(275) forState:UIControlStateNormal];
    }
    
    
    self.titleL.text = kFormat(data.title).ht_isEmptyStr;
    CGFloat rate = [kFormat(data.rate).ht_isEmptyStr floatValue];
    if (rate > 0) {
        self.starrView.hidden = NO;
        self.starrView.value = rate * 0.5;
        self.scoreL.hidden = NO;
        self.scoreL.text = [NSString stringWithFormat:@"%.1f", rate];
        [self.starContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.titleL);
            make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(140, 20));
        }];
        [self.downArrowButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.starContentV.mas_centerY);
        }];
    } else {
        //评分数据为空，不显示评分
        self.starrView.hidden = YES;
        self.starrView.value = 0;
        self.scoreL.hidden = YES;
        self.scoreL.text = @"";
        [self.starContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.titleL);
            make.top.mas_equalTo(self.titleL.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(140, 0));
        }];
        [self.downArrowButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.titleL.mas_centerY);
        }];
    }
    
    self.locationL.text = kFormat(data.country).ht_isEmptyStr;
    self.filmTypeL.text = kFormat(data.stars).ht_isEmptyStr;
    
    self.infoContentL.text = kFormat(data.var_descript).ht_isEmptyStr;
    self.starContentV.hidden = NO;
    self.infoL.hidden = NO;
    if (data.var_detailMore) {
        self.infoContentL.hidden = NO;
        self.infoL.hidden = NO;
        self.infoL.text = @"Info";
    } else {
        self.infoContentL.hidden = YES;
        self.infoL.hidden = YES;
        self.infoL.text = @"";
    }
}

- (void)ht_downArrowButtonAction:(UIButton *)sender {
    
    self.var_isDown = !self.var_isDown;
    if(self.var_isDown){
        //旋转90度
        sender.transform = CGAffineTransformRotate(sender.transform, M_PI);
    }else{
        //还原
        sender.transform = CGAffineTransformIdentity;
    }
    if(self.BLOCK_arrowDownButtonActionBlock){
        self.BLOCK_arrowDownButtonActionBlock(self.var_isDown);
    }
}

@end

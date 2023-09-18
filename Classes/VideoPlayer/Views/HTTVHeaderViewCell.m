//
//  HTTVHeaderViewCell.m
// 
//
//  Created by Apple on 2023/3/4.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTTVHeaderViewCell.h"
#import "HTAdViewManager.h"
#import "HTTVPlayDetailModel.h"
#import "HTHistoryData.h"
#import "HTTVHeaderCellManager.h"
#import "HTDropdownListView.h"
#import "HTTVPlayDetailSSNModel.h"
#import "HTTVPlayDetailSSNListModel.h"

@interface HTTVHeaderViewCell ()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIView *starContentV;
@property (nonatomic, strong) UILabel *scoreL;
@property (nonatomic, strong) UILabel *locationL;
@property (nonatomic, strong) UILabel *filmTypeL;
@property (nonatomic, strong) UILabel *filmStarsL;
@property (nonatomic, strong) UILabel *infoL;
@property (nonatomic, strong) UILabel *infoContentL;
@property (nonatomic, strong) UILabel *episodeL;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) HTDropdownListView *var_dropdownListView;
@property (nonatomic, strong) HCSStarRatingView * starView;
@property (nonatomic, strong) UIButton *downArrowButton;
@property (nonatomic, assign) BOOL var_isDown;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *watchLaterButton;

@end

@implementation HTTVHeaderViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self ht_addCellSubViews];
    }
    return self;
}

- (void)ht_addCellSubViews {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    self.titleL = [HTTVHeaderCellManager lgjeropj_titleLabel];
    [self.contentView addSubview:self.titleL];
    
    self.starContentV = [HTTVHeaderCellManager lgjeropj_starContentView];
    [self.contentView addSubview:self.starContentV];
    
    self.scoreL = [HTTVHeaderCellManager lgjeropj_scoreLabel];
    [self.starContentV addSubview:self.scoreL];
    
    self.locationL = [HTTVHeaderCellManager lgjeropj_locationLabel];
    [self.contentView addSubview:self.locationL];
    
    self.filmTypeL = [HTTVHeaderCellManager lgjeropj_filmTypeLabel];
    [self.contentView addSubview:self.filmTypeL];
    
    self.filmStarsL = [HTTVHeaderCellManager lgjeropj_filmStarsLabel];
    [self.contentView addSubview:self.filmStarsL];
    
    self.downArrowButton = [HTTVHeaderCellManager lgjeropj_downArrowButton];
    [self.downArrowButton addTarget:self action:@selector(downArrowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.downArrowButton];
    
    self.infoL = [HTTVHeaderCellManager lgjeropj_infoLabel];
    [self.contentView addSubview:self.infoL];
    
    self.infoContentL = [HTTVHeaderCellManager lgjeropj_infoContentLabel];
    [self.contentView addSubview:self.infoContentL];
    
    self.episodeL = [HTTVHeaderCellManager lgjeropj_episodeLabel];
    [self.contentView addSubview:self.episodeL];
    
    self.lineV = [HTTVHeaderCellManager lgjeropj_lineView];
    [self.contentView addSubview:self.lineV];
    
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
        make.height.mas_equalTo(16);
    }];
    
    [self.filmStarsL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.filmTypeL.mas_bottom).offset(6);
    }];
    
    [self.infoL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.filmStarsL.mas_bottom).offset(14);
        make.height.mas_offset(18);
    }];
    
    [self.infoContentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.infoL.mas_bottom).offset(6);
    }];
    
    self.bottomView = [HTTVHeaderCellManager lgjeropj_bottomView];
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(-45);
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
    
    [self.episodeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_bottom).inset(20);
        make.leading.mas_equalTo(self.titleL);
        make.bottom.mas_equalTo(self).inset(14);
        make.height.mas_equalTo(19);
    }];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    self.starView = [HTTVHeaderCellManager lgjeropj_starView];
    [self.starContentV addSubview:self.starView];
    [self.downArrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.starContentV.mas_centerY);
    }];
    
    self.var_dropdownListView = [HTTVHeaderCellManager lgjeropj_listView];
    @weakify(self);
    [self.var_dropdownListView ht_setDropdownListViewSelectedBlock:^(HTDropdownListView *var_dropdownListView) {
        @strongify(self);
        if (self.BLOCK_HTSwitchEpsSeason) {
            self.BLOCK_HTSwitchEpsSeason(var_dropdownListView.var_selectedItem.var_itemId, var_dropdownListView.selectIndex);
        }
    }];
    [self addSubview:self.var_dropdownListView];
    
    [self.var_dropdownListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(15);
        make.size.mas_equalTo(CGSizeMake(98, 28));
        make.centerY.mas_equalTo(self.episodeL);
    }];
}

- (void)ht_buttonAction:(UIButton *)sender{
    //电视剧的 收藏/分享/反馈
    if(self.BLOCK_operationButtonBlock){
        self.BLOCK_operationButtonBlock(sender);
    }
}

- (void)ht_updateHeaderWithData:(HTTVPlayDetailSSNModel *)data {
    
    HTHistoryData *historyData = HTCommonConfiguration.lgjeropj_shared.BLOCK_watchLaterSearchVideoByVideoIdBlock(data.var_idNum);
    //获取第一个button
    if(historyData){
        [self.watchLaterButton sd_setImageWithURL:kImageNumber(276) forState:UIControlStateNormal];
    }else{
        [self.watchLaterButton sd_setImageWithURL:kImageNumber(275) forState:UIControlStateNormal];
    }
    
    self.titleL.text = data.title;
    CGFloat rate = [kFormat(data.rate).ht_isEmptyStr floatValue];
    if (rate > 0) {
        self.starView.hidden = NO;
        self.starView.value = rate * 0.5;
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
        self.starView.hidden = YES;
        self.starView.value = 0;
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
    self.locationL.text = data.country;
    self.filmTypeL.text = data.tags;
    self.filmStarsL.text = data.var_castString;
        
    NSMutableArray *tEpsDatas = [NSMutableArray array];
    for (int i = 0; i < data.ssn_list.count; i++) {
        HTTVPlayDetailSSNListModel *ddmodel = data.ssn_list[i];
        NSString *epdId = ddmodel.var_idNum;
        HTDropdownListItem *item = [[HTDropdownListItem alloc] initWithItem:epdId withName:ddmodel.title];
        [tEpsDatas addObject:item];
    }
    self.var_dropdownListView.dataSource = tEpsDatas;
    self.starContentV.hidden = NO;
    self.episodeL.hidden = NO;
    self.var_dropdownListView.hidden = NO;
    self.lineV.hidden = NO;
    self.infoContentL.text = kFormat(data.var_descript).ht_isEmptyStr;
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

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex{
    self.var_dropdownListView.selectIndex = selectedIndex;
}

- (void)downArrowButtonAction:(UIButton *)sender{
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

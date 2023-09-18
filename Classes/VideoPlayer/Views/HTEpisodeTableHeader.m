//
//  HTEpisodeTableHeader.m
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTEpisodeTableHeader.h"
#import "HTEpisodeHeaderManager.h"

@interface HTEpisodeTableHeader ()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIView *starContentV;
@property (nonatomic, strong) UILabel *scoreL;
@property (nonatomic, strong) UILabel *locationL;
@property (nonatomic, strong) UILabel *filmTypeL;
@property (nonatomic, strong) UILabel *filmStarsL;
@property (nonatomic, strong) UILabel *episodeL;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) HTDropdownListView *var_listView;
@property (nonatomic, strong) HCSStarRatingView * starrView;

@end

@implementation HTEpisodeTableHeader

- (instancetype)initWithFrame:(CGRect)frame andType:(NSInteger)var_videoType {
    
    if (self = [super initWithFrame:frame]) {
        [self ht_addSubviewsWithtype:var_videoType];
    }
    return self;
}

- (void)ht_addSubviewsWithtype:(ENUM_HTVideoType)headerType {
    
    self.titleL = [HTEpisodeHeaderManager lgjeropj_titleLabel];
    [self addSubview:self.titleL];
    
    self.starContentV = [HTEpisodeHeaderManager lgjeropj_starContentView];
    [self addSubview:self.starContentV];
    
    self.scoreL = [HTEpisodeHeaderManager lgjeropj_scoreLabel];
    [self.starContentV addSubview:self.scoreL];
    
    self.locationL = [HTEpisodeHeaderManager lgjeropj_locationLabel];
    [self addSubview:self.locationL];
    
    self.filmTypeL = [HTEpisodeHeaderManager lgjeropj_filmTypeLabel];
    [self addSubview:self.filmTypeL];
    
    self.filmStarsL = [HTEpisodeHeaderManager lgjeropj_filmStarsLabel];
    [self addSubview:self.filmStarsL];
    
    self.episodeL = [HTEpisodeHeaderManager lgjeropj_episodeLabel];
    [self addSubview:self.episodeL];
    
    self.lineV = [HTEpisodeHeaderManager lgjeropj_lineView];
    [self addSubview:self.lineV];

    [self layoutIfNeeded];    
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH-58);
        make.top.mas_equalTo(13);
        make.height.mas_equalTo(21);
    }];
    
    [self.starContentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleL);
        make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(140, 20));
    }];
    
    [self.scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.mas_equalTo(self.starContentV);
        make.centerY.equalTo(self.starContentV.mas_centerY);
    }];
    
    [self.locationL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH-28);
        make.top.mas_equalTo(self.starContentV.mas_bottom).offset(16);
    }];
    
    [self.filmTypeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH-28);
        make.top.mas_equalTo(self.locationL.mas_bottom).offset(6);
    }];
    
    [self.filmStarsL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(SCREEN_WIDTH-28);
        make.top.mas_equalTo(self.filmTypeL.mas_bottom).offset(6);
    }];
    
    [self.episodeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.filmStarsL.mas_bottom).offset(15);
        make.leading.mas_equalTo(self.titleL);
        make.bottom.mas_equalTo(self).inset(14);
    }];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    self.starrView = [HTEpisodeHeaderManager lgjeropj_starView];
    [self.starContentV addSubview:self.starrView];
    
    self.var_listView = [HTEpisodeHeaderManager lgjeropj_listView];
    @weakify(self);
    [self.var_listView ht_setDropdownListViewSelectedBlock:^(HTDropdownListView *var_listView) {
        @strongify(self);
        if (self.BLOCK_HTSwitchEpsSeason) {
            self.BLOCK_HTSwitchEpsSeason(var_listView.var_selectedItem.var_itemId, var_listView.selectIndex);
        }
    }];
    [self addSubview:self.var_listView];
    [self.var_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(15);
        make.size.mas_equalTo(CGSizeMake(98, 28));
        make.centerY.mas_equalTo(self.episodeL);
    }];
}

- (void)ht_updateHeaderWithData:(HTTVPlayDetailSSNModel *)data {
    self.titleL.text = data.title;
    CGFloat rate = [kFormat(data.rate).ht_isEmptyStr floatValue];
    if(rate > 0){
        self.starrView.hidden = NO;
        self.starrView.value = rate * 0.5;
        self.scoreL.hidden = NO;
        self.scoreL.text = [NSString stringWithFormat:@"%.1f", rate];
        [self.starContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.titleL);
            make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(140, 20));
        }];
    }else{
        //评分数据为空，不显示评分
        self.starrView.hidden = YES;
        self.starrView.value = 0;
        self.scoreL.hidden = YES;
        self.scoreL.text = @"";
        [self.starContentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.titleL);
            make.top.mas_equalTo(self.titleL.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(140, 0));
        }];
    }
    self.locationL.text = data.country;
    self.filmTypeL.text = data.tags;
    
    NSMutableArray *tCasts = [NSMutableArray array];
    for (HTTVPlayDetailCastsModel *var_tempModel in data.casts) {
        [tCasts addObject:var_tempModel.star_name];
    }
    
    self.filmStarsL.text = [tCasts componentsJoinedByString:@" "];
        
    NSMutableArray *tEpsDatas = [NSMutableArray array];
    for (int i = 0; i < data.ssn_list.count; i++) {
        HTTVPlayDetailSSNListModel *model = data.ssn_list[i];
        NSString *epdId = model.var_idNum;
        HTDropdownListItem *item = [[HTDropdownListItem alloc] initWithItem:epdId withName:model.title];
        [tEpsDatas addObject:item];
    }
    self.var_listView.dataSource = tEpsDatas;
    self.starContentV.hidden = NO;
    self.episodeL.hidden = NO;
    self.var_listView.hidden = NO;
    self.lineV.hidden = NO;
}

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex{
    self.var_listView.selectIndex = selectedIndex;
}

@end

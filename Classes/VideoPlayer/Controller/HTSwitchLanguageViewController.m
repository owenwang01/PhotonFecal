//
//  HTSwitchLanguageViewController.m
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSwitchLanguageViewController.h"
#import "HTSwitchLanguageViewManager.h"

@interface HTSwitchLanguageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *var_rightContainerView;
@property (nonatomic, strong) UIView *gradientContainerV;
@property (nonatomic, weak, nullable) MSPlume *player;
@property (nonatomic, strong) UIImageView *backArrowImg;
@property (nonatomic, strong) UILabel *var_subtitlesL;
@property (nonatomic, strong) UIButton *coverBtn;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UITableView *tableV;
@end

@implementation HTSwitchLanguageViewController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ht_addSubviews];
}

- (void)ht_addSubviews {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.var_rightContainerView = [HTSwitchLanguageViewManager lgjeropj_rightContainerView];
    [self.view addSubview:self.var_rightContainerView];
    
    self.gradientContainerV = [HTSwitchLanguageViewManager lgjeropj_gradientContainerView];
    [self.var_rightContainerView addSubview:self.gradientContainerV];
    
    self.var_subtitlesL = [HTSwitchLanguageViewManager lgjeropj_subtitlesL];
    [self.var_rightContainerView addSubview:self.var_subtitlesL];
    
    self.backArrowImg = [HTSwitchLanguageViewManager lgjeropj_backArrowImg];
    [self.var_rightContainerView addSubview:self.backArrowImg];
    
    self.coverBtn = [HTSwitchLanguageViewManager lgjeropj_coverBtn];
    [self.coverBtn addTarget:self action:@selector(coverBtnCilck) forControlEvents:UIControlEventTouchUpInside];
    [self.var_rightContainerView addSubview:self.coverBtn];
    
    self.lineV = [HTSwitchLanguageViewManager lgjeropj_lineView];
    [self.var_rightContainerView addSubview:self.lineV];
    
    self.tableV = [HTSwitchLanguageViewManager lgjeropj_tableView:self];
    [self.var_rightContainerView addSubview:self.tableV];
    
    [self.var_rightContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset(0);
        make.width.mas_equalTo(360);
    }];
    
    [self.gradientContainerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.var_subtitlesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.gradientContainerV).offset(50);
        make.leading.mas_equalTo(self.gradientContainerV).offset(75);
        make.height.mas_equalTo(21);
    }];
    
    [self.backArrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.var_subtitlesL);
        make.trailing.mas_equalTo(self.var_subtitlesL.mas_leading).inset(10);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.backArrowImg);
        make.top.bottom.trailing.mas_equalTo(self.var_subtitlesL);
    }];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.var_subtitlesL);
        make.trailing.mas_equalTo(self.gradientContainerV);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.var_subtitlesL.mas_bottom).offset(15);
    }];
    
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.var_subtitlesL);
        make.top.mas_equalTo(self.lineV.mas_bottom).offset(24);
        make.trailing.mas_equalTo(self.gradientContainerV).inset(24);
        make.bottom.mas_equalTo(self.gradientContainerV).inset(41);
    }];
}

#pragma mark -- video player
// 控制层入场
//     当播放器将要切换到此控制层时, 该方法将会被调用
//     可以在这里做入场的操作
//
- (void)restartControlLayer {
    _restarted = YES;
    if ( self.player.isFurry ) [self.player needHiddenStatusBar];
    ms_view_makeAppear(self.plume_controlView, YES);
    ms_view_makeAppear(self.var_rightContainerView, YES);
}

//
// 退出控制层
//     当播放器将要切换到其他控制层时, 该方法将会被调用
//     可以在这里处理退出控制层的操作
//
- (void)exitControlLayer {
    _restarted = NO;
    
    ms_view_makeDisappear(self.var_rightContainerView, YES);
    ms_view_makeDisappear(self.plume_controlView, YES, ^{
        if ( !self->_restarted ) [self.plume_controlView removeFromSuperview];
    });
}

/**
 * 测试 会被混淆 全局搜索替换
 */
- (UIView *)plume_controlView {
    return self.view;
}

//
// 当controlView被添加到播放器时, 该方法将会被调用
//
- (void)installedControlViewToPlume:(__kindof MSBornPlume *)plume {
    _player = plume;
    
    if ( self.view.layer.needsLayout ) {
        ms_view_initializes(self.var_rightContainerView);
    }
    
    ms_view_makeDisappear(self.var_rightContainerView, NO);
}

//
// 当调用播放器的controlLayerNeedAppear时, 播放器将会回调该方法
//
- (void)controlLayerNeedAppear:(__kindof MSBornPlume *)plume {}

//
// 当调用播放器的controlLayerNeedDisappear时, 播放器将会回调该方法
//
- (void)controlLayerNeedDisappear:(__kindof MSBornPlume *)plume {}

//
// 当将要触发某个手势时, 该方法将会被调用. 返回NO, 将不触发该手势
//
- (BOOL)plume:(__kindof MSBornPlume *)plume gestureRecognizerShouldTrigger:(MSCharmGestureType)type location:(CGPoint)location {
    if ( type == MSCharmGestureType_SingleTap ) {
        if ( !CGRectContainsPoint(self.var_rightContainerView.frame, location) ) {
            if ( [self.delegate respondsToSelector:@selector(ht_switchLanguageLayerTappedBlankAreaOnTheControlLayer:)] ) {
                [self.delegate ht_switchLanguageLayerTappedBlankAreaOnTheControlLayer:self];
            }
        }
    }
    return NO;
}

//
// 当将要触发旋转时, 该方法将会被调用. 返回NO, 将不触发旋转
//
- (BOOL)canTriggerRotationOfPlume:(__kindof MSBornPlume *)plume {
    return NO;
}

#pragma mark -- Action
- (void)coverBtnCilck {
    [_player.switcher switchControlLayerForIdentifier:102];
    [_player controlLayerNeedAppear];
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subtitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTSwitchLanguageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTSwitchLanguageCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    HTSubtitleModel *model = self.subtitles[indexPath.row];
    cell.cellText = model.l_display;
    if (model.isSelected) {
        [cell switchLanguageCellSelected:YES];
    } else {
        [cell switchLanguageCellSelected:NO];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    for (HTSubtitleModel *model in self.subtitles) {
        model.isSelected = NO;
    }
    HTSubtitleModel *model = self.subtitles[indexPath.row];
    model.isSelected = YES;
    [self.tableV reloadData];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ht_switchLanguageLayerCellClick:)]) {
        [self.delegate ht_switchLanguageLayerCellClick:model];
    }
}

@end


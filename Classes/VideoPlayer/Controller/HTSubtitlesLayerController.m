//
//  HTSubtitlesLayerController.m
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubtitlesLayerController.h"
#import "HTSubtitleLayerManager.h"

@interface HTSubtitlesLayerController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *var_rightContainerView;
@property (nonatomic, strong) UIView *gradientContainerV;
@property (nonatomic, weak, nullable) MSBornPlume *player;
@property (nonatomic, strong) UILabel *var_subtitlesL;
@property (nonatomic, strong) UIButton *switchBtn;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UITableView *tableV;
@property (nonatomic, strong) NSArray *subtitlesArr;
@property (nonatomic, strong) NSArray *imageNames;

@end

@implementation HTSubtitlesLayerController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ht_addSubviews];
    self.subtitlesArr = @[LocalString(@"Adjust subtitle time", nil), LocalString(@"Switch language", nil)];
    self.imageNames = @[kImageNumber(104), kImageNumber(173)];
}

- (void)ht_addSubviews {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.var_rightContainerView = [HTSubtitleLayerManager lgjeropj_rightContainerView];
    [self.view addSubview:self.var_rightContainerView];
    
    self.gradientContainerV = [HTSubtitleLayerManager lgjeropj_gradientContainerView];
    [self.var_rightContainerView addSubview:self.gradientContainerV];
    
    self.var_subtitlesL = [HTSubtitleLayerManager lgjeropj_subtitlesL];
    [self.var_rightContainerView addSubview:self.var_subtitlesL];
    
    self.switchBtn = [HTSubtitleLayerManager lgjeropj_switchBtn];
    [self.var_rightContainerView addSubview:self.switchBtn];
    
    self.lineV = [HTSubtitleLayerManager lgjeropj_lineView];
    [self.var_rightContainerView addSubview:self.lineV];
    
    self.tableV = [HTSubtitleLayerManager lgjeropj_tableView:self];
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
        make.leading.mas_equalTo(self.gradientContainerV).offset(50);
        make.size.mas_equalTo(CGSizeMake(70, 19));
    }];
    
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.gradientContainerV).inset(38);
        make.centerY.equalTo(self.var_subtitlesL);
        make.size.mas_equalTo(CGSizeMake(42, 42));
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
            if ( [self.delegate respondsToSelector:@selector(ht_subtitlesLayerTappedBlankAreaOnTheControlLayer:)] ) {
                [self.delegate ht_subtitlesLayerTappedBlankAreaOnTheControlLayer:self];
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

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTSubtitlesLayerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTSubtitlesLayerCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.subTitleText = self.subtitlesArr[indexPath.row];
    cell.cellImgName = self.imageNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(ht_subtitlesLayerClickAction:)]) {
        [self.delegate ht_subtitlesLayerClickAction:indexPath.row];
    }
}

#pragma mark -- Action
- (void)switchBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ht_subtitlesLayerSwitchBtnAction:)]) {
        [self.delegate ht_subtitlesLayerSwitchBtnAction:sender.selected];
    }
}

@end

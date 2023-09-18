//
//  HTAdjustSubtitleTimeViewController.m
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTAdjustSubtitleTimeViewController.h"
#import "HTAdjustSubtitleViewManager.h"

@interface HTAdjustSubtitleTimeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *var_rightContainerView;
@property (nonatomic, strong) UIView *gradientContainerV;
@property (nonatomic, weak, nullable) MSPlume *player;
@property (nonatomic, strong) UIImageView *backArrowImg;
@property (nonatomic, strong) UILabel *var_subtitlesL;
@property (nonatomic, strong) UIButton *coverBtn;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *upArrowBtn;
@property (nonatomic, strong) UIButton *m05SecBtn;
@property (nonatomic, strong) UIButton *reSetBtn;
@property (nonatomic, strong) UIButton *p05SecBtn;
@property (nonatomic, strong) UIButton *downArrorBtn;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger tempCurrentIndex;
@property (nonatomic, assign) BOOL isClick;

@end

@implementation HTAdjustSubtitleTimeViewController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.dataArray = self.player.resource.subtitles.mutableCopy;
    [self.tableView reloadData];
    kself
    self.player.playbackObserver.currentTimeDidChangeExeBlock = ^(__kindof MSBornPlume * _Nonnull player) {
        [weakSelf ht_updateSubtitleWithCurrentTime:player.currentTime];
    };
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.player.playbackObserver.currentTimeDidChangeExeBlock = nil;
}

- (void)lgjeropj_addSubviews {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.var_rightContainerView = [HTAdjustSubtitleViewManager lgjeropj_rightContainerView];
    [self.view addSubview:self.var_rightContainerView];
    
    self.gradientContainerV = [HTAdjustSubtitleViewManager lgjeropj_gradientContainerView];
    [self.var_rightContainerView addSubview:self.gradientContainerV];
    
    self.var_subtitlesL = [HTAdjustSubtitleViewManager lgjeropj_subtitlesL];
    [self.var_rightContainerView addSubview:self.var_subtitlesL];
    
    self.backArrowImg = [HTAdjustSubtitleViewManager lgjeropj_backArrowImg];
    [self.var_rightContainerView addSubview:self.backArrowImg];
    
    self.coverBtn = [HTAdjustSubtitleViewManager lgjeropj_coverBtn];
    [self.coverBtn addTarget:self action:@selector(coverBtnCilck) forControlEvents:UIControlEventTouchUpInside];
    [self.var_rightContainerView addSubview:self.coverBtn];
    
    self.lineV = [HTAdjustSubtitleViewManager lgjeropj_lineView];
    [self.var_rightContainerView addSubview:self.lineV];
    
    self.tableView = [HTAdjustSubtitleViewManager lgjeropj_tableView:self];
    [self.var_rightContainerView addSubview:self.tableView];
    
    self.upArrowBtn = [HTAdjustSubtitleViewManager lgjeropj_upArrowBtn];
    __weak typeof(self) weakSelf = self;
    [[self.upArrowBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_adjustButtonActionWithType:ENUM_AdjustButtonClick_Last];
    }];
    [self.var_rightContainerView addSubview:self.upArrowBtn];
    
    self.m05SecBtn = [HTAdjustSubtitleViewManager lgjeropj_m05SecBtn];
    [[self.m05SecBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_adjustButtonActionWithType:ENUM_AdjustButtonClick_Minus];
    }];
    [self.var_rightContainerView addSubview:self.m05SecBtn];
    
    self.reSetBtn = [HTAdjustSubtitleViewManager lgjeropj_reSetBtn];
    [[self.reSetBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_adjustButtonActionWithType:ENUM_AdjustButtonClick_Reset];
    }];
    [self.var_rightContainerView addSubview:self.reSetBtn];
    
    self.p05SecBtn = [HTAdjustSubtitleViewManager lgjeropj_p05SecBtn];
    [[self.p05SecBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_adjustButtonActionWithType:ENUM_AdjustButtonClick_Plus];
    }];
    [self.var_rightContainerView addSubview:self.p05SecBtn];
    
    self.downArrorBtn = [HTAdjustSubtitleViewManager lgjeropj_downArrorBtn];
    [[self.downArrorBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_adjustButtonActionWithType:ENUM_AdjustButtonClick_Next];
    }];
    [self.var_rightContainerView addSubview:self.downArrorBtn];
    
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
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.var_subtitlesL);
        make.top.mas_equalTo(self.lineV.mas_bottom).offset(24);
        make.trailing.mas_equalTo(self.gradientContainerV).inset(74);
        make.bottom.mas_equalTo(self.gradientContainerV).inset(41);
    }];
    
    [self.upArrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineV.mas_bottom).offset(22);
        make.trailing.mas_equalTo(self.gradientContainerV).inset(34);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.m05SecBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.upArrowBtn.mas_bottom).offset(24);
        make.centerX.mas_equalTo(self.upArrowBtn);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.reSetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.m05SecBtn.mas_bottom).offset(24);
        make.centerX.mas_equalTo(self.upArrowBtn);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.p05SecBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.reSetBtn.mas_bottom).offset(24);
        make.centerX.mas_equalTo(self.upArrowBtn);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.downArrorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.p05SecBtn.mas_bottom).offset(24);
        make.centerX.mas_equalTo(self.upArrowBtn);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
}

#pragma mark - 更新当前显示的字幕显示
- (void)ht_updateSubtitleWithCurrentTime:(NSTimeInterval)currentTime{
    MSSubtitleItem *currentItem = nil;
    NSInteger index = 0;
    for (; index < self.player.resource.subtitles.count; index++) {
        MSSubtitleItem *item = self.player.resource.subtitles[index];
        if(MSTimeRangeContainsTime(currentTime, item.range)){
            currentItem = item;
            break;
        }
    }
    if(currentItem){
        if(index == self.currentIndex){
            return;
        }
        self.currentIndex = index;
        if (index > 0 && !self.isClick && self.dataArray.count > index) {
            NSIndexPath *currentPath = [NSIndexPath indexPathForRow:index inSection:0];
            NSIndexPath *previousPath = [NSIndexPath indexPathForRow:index - 1 inSection:0];
            [self.tableView reloadRowsAtIndexPaths:@[previousPath, currentPath] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView scrollToRowAtIndexPath:currentPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
    }
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
            if ( [self.delegate respondsToSelector:@selector(ht_adjustLayerTappedBlankAreaOnTheControlLayer:)] ) {
                [self.delegate ht_adjustLayerTappedBlankAreaOnTheControlLayer:self];
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
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HTAdjustCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTAdjustCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    MSSubtitleItem *model = self.dataArray[indexPath.row];
    cell.subtitleText = model.content;
    if(self.currentIndex == indexPath.row && !self.isClick){
        cell.cellTextColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    }else if(self.tempCurrentIndex == indexPath.row && self.isClick){
        cell.cellTextColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    }else{
        cell.cellTextColor = [UIColor ht_colorWithHexString:@"#5D5D70"];
    }
    return cell;
}

#pragma mark - 操作按钮回调
- (void)ht_adjustButtonActionWithType:(ENUM_AdjustButtonClickType)type{
    if([self.delegate respondsToSelector:@selector(ht_adjustLayerTimeWithType:)]){
        [self.delegate ht_adjustLayerTimeWithType:type];
    }
    
    if(type == ENUM_AdjustButtonClick_Last || type == ENUM_AdjustButtonClick_Next){
        if(!self.isClick){
            self.isClick = YES;
            self.tempCurrentIndex = self.currentIndex;
        }
        if(type == ENUM_AdjustButtonClick_Last){
            self.tempCurrentIndex -= 1;
            //防止越界
            if(self.tempCurrentIndex < 0){
                self.tempCurrentIndex = 0;
            }
        }else{
            self.tempCurrentIndex += 1;
            //防止越界
            if(self.tempCurrentIndex > self.dataArray.count){
                self.tempCurrentIndex = self.dataArray.count - 1;
            }
        }
        NSInteger current = self.tempCurrentIndex;
        if(current < self.dataArray.count){
            if(current > 0){
                NSIndexPath *currentPath = [NSIndexPath indexPathForRow:current inSection:0];
                NSIndexPath *previousPath = [NSIndexPath indexPathForRow:current-1 inSection:0];
                NSMutableArray *indexArray = @[currentPath, previousPath].mutableCopy;
                if(current + 1 < self.dataArray.count){
                    NSIndexPath *nextPath = [NSIndexPath indexPathForRow:current+1 inSection:0];
                    [indexArray addObject:nextPath];
                }
                [self.tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationNone];
                [self.tableView scrollToRowAtIndexPath:currentPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            }
        }
    }else{
        self.isClick = NO;
        self.tempCurrentIndex = self.currentIndex;
        NSInteger current = self.tempCurrentIndex;
        [self.tableView reloadData];
        if(current < self.dataArray.count){
            NSIndexPath *currentPath = [NSIndexPath indexPathForRow:current inSection:0];
            [self.tableView scrollToRowAtIndexPath:currentPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:YES];
        }
    }
}

@end

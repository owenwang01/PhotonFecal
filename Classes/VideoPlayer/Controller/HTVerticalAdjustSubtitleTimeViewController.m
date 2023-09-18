//
//  HTVerticalAdjustSubtitleTimeViewController.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVerticalAdjustSubtitleTimeViewController.h"
#import "HTAdjustSubtitleTimeViewController.h"
#import "HTAdjustSubtitleViewManager.h"

@interface HTVerticalAdjustSubtitleTimeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UIView *lineVBottom;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger tempCurrentIndex;
@property (nonatomic, assign) BOOL isClick;

@end

@implementation HTVerticalAdjustSubtitleTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor ht_colorWithHexString:@"#232336"];
    
    self.dataArray = self.player.resource.subtitles.mutableCopy;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    kself
    self.player.playbackObserver.currentTimeDidChangeExeBlock = ^(__kindof MSBornPlume * _Nonnull player) {
        [weakSelf ht_updateSubtitleWithCurrentTime:player.currentTime];
    };
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.player.playbackObserver.currentTimeDidChangeExeBlock = nil;
}

- (void)lgjeropj_layoutNavigation{
    [super lgjeropj_layoutNavigation];
    [self lgjeropj_setBarTintColor:[UIColor ht_colorWithHexString:@"#232336"]];
    self.navigationItem.leftBarButtonItem = [HTAdjustSubtitleViewManager lgjeropj_backButton:self andIsWhite:NO];
}

- (void)lgjeropj_addSubviews {
    
    self.lineV = [HTAdjustSubtitleViewManager lgjeropj_vertical_lineView];
    [self.view addSubview:self.lineV];
    
    self.tableView = [HTAdjustSubtitleViewManager lgjeropj_vertical_tableView:self];
    [self.view addSubview:self.tableView];
    
    self.lineVBottom = [HTAdjustSubtitleViewManager lgjeropj_vertical_lineView];
    [self.view addSubview:self.lineVBottom];
    
    self.cancelButton = [HTAdjustSubtitleViewManager lgjeropj_cancelButton];
    __weak typeof(self) weakSelf = self;
    [[self.cancelButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_cancelSetting];
    }];
    [self.view addSubview:self.cancelButton];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kBarHeight);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.mas_equalTo(weakSelf.lineV.mas_bottom).offset(0);
        make.trailing.mas_equalTo(weakSelf.view).inset(16);
        //make.bottom.equalTo(self.cancelButton.mas_top);
    }];
    UIView *bottomOperationView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:bottomOperationView];
    [bottomOperationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tableView.mas_bottom);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(weakSelf.lineVBottom.mas_top);
    }];
    [self.lineVBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(weakSelf.cancelButton.mas_top);
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(weakSelf.mas_bottomLayoutGuideTop);
    }];
    
    //添加操作按钮
    UIButton *buttonOn = [self ht_operationButtonWithImage:kImageNumber(272) andType:ENUM_AdjustButtonClick_Last];
    UIButton *buttonMiuns = [self ht_operationButtonWithImage:kImageNumber(271) andType:ENUM_AdjustButtonClick_Minus];
    UIButton *buttonReset = [self ht_operationButtonWithImage:kImageNumber(269) andType:ENUM_AdjustButtonClick_Reset];
    UIButton *buttonPlus = [self ht_operationButtonWithImage:kImageNumber(270) andType:ENUM_AdjustButtonClick_Plus];
    UIButton *buttonNext = [self ht_operationButtonWithImage:kImageNumber(273) andType:ENUM_AdjustButtonClick_Next];
    NSArray *opearArray = @[buttonOn, buttonMiuns, buttonReset, buttonPlus, buttonNext];
    for (UIButton *sender in opearArray) {
        [bottomOperationView addSubview:sender];
    }
    [opearArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [opearArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0.0);
        make.height.equalTo(@50.0);
    }];
}

- (UIButton *)ht_operationButtonWithImage:(NSURL *)image andType:(ENUM_AdjustButtonClickType)type{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = type;
    [button sd_setImageWithURL:image forState:UIControlStateNormal];
    kself
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf ht_operationButtonActionWithType:x.tag];
    }];
    return button;
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
        if(index > 0 && !self.isClick && self.dataArray.count > index){
            NSIndexPath *currentPath = [NSIndexPath indexPathForRow:index inSection:0];
            NSIndexPath *previousPath = [NSIndexPath indexPathForRow:index - 1 inSection:0];
            [self.tableView reloadRowsAtIndexPaths:@[previousPath, currentPath] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView scrollToRowAtIndexPath:currentPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
    }
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

#pragma mark - 事件处理
- (void)ht_cancelSetting{
    [self.navigationController willMoveToParentViewController:nil];
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
}

- (void)ht_operationButtonActionWithType:(ENUM_AdjustButtonClickType)type{
    if(self.BLOCK_adjustButtonActionBlock){
        self.BLOCK_adjustButtonActionBlock(type);
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

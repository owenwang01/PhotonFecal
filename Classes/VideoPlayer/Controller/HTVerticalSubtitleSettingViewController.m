//
//  HTVerticalSubtitleSettingViewController.m
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVerticalSubtitleSettingViewController.h"
#import "HTSubtitlesLayerController.h"
#import "HTVerticalSwitchLanguageViewController.h"
#import "HTVerticalAdjustSubtitleTimeViewController.h"
#import "HTSwitchLanguageViewController.h"
#import "HTAdjustSubtitleTimeViewController.h"
#import "HTSubtitleSettingViewManager.h"

@interface HTVerticalSubtitleSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *var_subtitlesL;
@property (nonatomic, strong) UIButton *switchBtn;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) NSArray *subtitlesArr;
@property (nonatomic, strong) NSArray *imageNames;

@end

@implementation HTVerticalSubtitleSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ht_addSubviews];
    self.subtitlesArr = @[LocalString(@"Adjust subtitle time", nil), LocalString(@"Switch language", nil)];
    self.imageNames = @[kImageNumber(104), kImageNumber(173)];
    
    self.title = LocalString(@"Subtitles", nil);
    self.view.backgroundColor = [UIColor ht_colorWithHexString:@"#232336"];
}

- (void)lgjeropj_layoutNavigation{
    [super lgjeropj_layoutNavigation];
    [self lgjeropj_setBarTintColor:[UIColor ht_colorWithHexString:@"#232336"]];
    self.navigationItem.leftBarButtonItem = [HTSubtitleSettingViewManager lgjeropj_backButton:self andIsWhite:NO];
}

- (void)lgjeropj_backBtnClick{
    [self ht_cancelSetting];
}

- (void)ht_addSubviews {
    
    self.lineV = [HTSubtitleSettingViewManager lgjeropj_lineView];
    [self.view addSubview:self.lineV];
    
    self.var_subtitlesL = [HTSubtitleSettingViewManager lgjeropj_subtitlesL];
    [self.view addSubview:self.var_subtitlesL];
    
    self.switchBtn = [HTSubtitleSettingViewManager lgjeropj_switchBtn];
    [self.switchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.switchBtn];
    
    self.tableView = [HTSubtitleSettingViewManager lgjeropj_tableView:self];
    [self.view addSubview:self.tableView];
    
    self.cancelButton = [HTSubtitleSettingViewManager lgjeropj_cancelButton];
    [self.cancelButton addTarget:self action:@selector(ht_cancelSetting) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cancelButton];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kBarHeight);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    [self.var_subtitlesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineV.mas_bottom).offset(22);
        make.left.mas_equalTo(16);
    }];
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.inset(12);
        make.centerY.equalTo(self.var_subtitlesL);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.mas_equalTo(self.var_subtitlesL.mas_bottom).offset(12);
        make.trailing.mas_equalTo(self.view).inset(16);
        make.bottom.equalTo(self.cancelButton.mas_top);
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        HTVerticalAdjustSubtitleTimeViewController *adjustVC = [[HTVerticalAdjustSubtitleTimeViewController alloc] init];
        adjustVC.player = self.player;
        kself
        adjustVC.BLOCK_adjustButtonActionBlock = ^(NSInteger type) {
            if([weakSelf.var_timeDelegate respondsToSelector:@selector(ht_adjustLayerTimeWithType:)]){
                [weakSelf.var_timeDelegate ht_adjustLayerTimeWithType:type];
            }
        };
        [self.navigationController pushViewController:adjustVC animated:YES];
    }else if(indexPath.row == 1){
        HTVerticalSwitchLanguageViewController *langugeVC = [[HTVerticalSwitchLanguageViewController alloc] init];
        langugeVC.subtitles = self.subtitles;
        kself
        langugeVC.BLOCK_selectSubtitleBlock = ^(HTSubtitleModel * _Nonnull model) {
            if([weakSelf.delegate respondsToSelector:@selector(ht_switchLanguageLayerCellClick:)]){
                [weakSelf.delegate ht_switchLanguageLayerCellClick:model];
            }
        };
        [self.navigationController pushViewController:langugeVC animated:YES];
    }
}

#pragma mark - 事件处理
- (void)ht_handSwitchButtonAction:(UISwitch *)sender{
    sender.selected = !sender.selected;
}

- (void)ht_cancelSetting{
    [self.navigationController willMoveToParentViewController:nil];
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
}

#pragma mark -- Action
- (void)switchBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.subtitleBlock) {
        self.subtitleBlock(sender.selected);
    }
}

@end

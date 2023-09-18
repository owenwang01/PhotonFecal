//
//  HTVerticalSwitchLanguageViewController.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVerticalSwitchLanguageViewController.h"
#import "HTSwitchLanguageViewController.h"
#import "HTSwitchLanguageViewManager.h"
#import "HTSubtitleModel.h"

@interface HTVerticalSwitchLanguageViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation HTVerticalSwitchLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor ht_colorWithHexString:@"#232336"];
}

- (void)lgjeropj_layoutNavigation{
    [super lgjeropj_layoutNavigation];
    [self lgjeropj_setBarTintColor:[UIColor ht_colorWithHexString:@"#232336"]];
    self.navigationItem.leftBarButtonItem = [HTSwitchLanguageViewManager lgjeropj_backButton:self andIsWhite:NO];
}

- (void)lgjeropj_addSubviews {
    
    self.lineV = [HTSwitchLanguageViewManager lgjeropj_vertical_lineView];
    [self.view addSubview:self.lineV];
    
    self.tableView = [HTSwitchLanguageViewManager lgjeropj_tableView:self];
    [self.view addSubview:self.tableView];
    
    self.cancelButton = [HTSwitchLanguageViewManager lgjeropj_cancelButton];
    [self.cancelButton addTarget:self action:@selector(ht_cancelSetting) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cancelButton];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kBarHeight);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.mas_equalTo(self.lineV.mas_bottom).offset(0);
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
    [self.tableView reloadData];
    if(self.BLOCK_selectSubtitleBlock){
        self.BLOCK_selectSubtitleBlock(model);
    }
}

#pragma mark - 事件处理
- (void)ht_cancelSetting{
    [self.navigationController willMoveToParentViewController:nil];
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
}

@end

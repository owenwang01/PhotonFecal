//
//  HTEpisodesControllLayerController.m
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTEpisodesControllLayerController.h"
#import "HTDropdownListView.h"
#import "HTEpisodesCollectionCell.h"
#import "HTEpisodesControllerManager.h"

@interface HTEpisodesControllLayerController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView *var_rightContainerView;
@property (nonatomic, strong) NSMutableArray *dArray;
@property (nonatomic, strong) HTDropdownListView *var_listView;
@property (nonatomic, strong) UIView *gradientContainerV;
@property (nonatomic, weak, nullable) MSBornPlume *player;
@property (nonatomic, strong) UILabel *episodesL;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) NSIndexPath *var_selectedIndexPath;
@property (nonatomic, strong) HTTVPlayDetailEpsListModel *var_currentEpsModel;//正在播放的集

@end

@implementation HTEpisodesControllLayerController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ht_addSubviews];
}

- (void)ht_addSubviews {
    
    self.view.backgroundColor = [UIColor clearColor];
    self.var_rightContainerView = [HTEpisodesControllerManager lgjeropj_rightContainerView];
    [self.view addSubview:self.var_rightContainerView];
    
    self.gradientContainerV = [HTEpisodesControllerManager lgjeropj_gradientContainerView];
    [self.var_rightContainerView addSubview:self.gradientContainerV];
    
    self.episodesL = [HTEpisodesControllerManager lgjeropj_episodesL];
    [self.var_rightContainerView addSubview:self.episodesL];
    
    self.lineV = [HTEpisodesControllerManager lgjeropj_lineView];
    [self.var_rightContainerView addSubview:self.lineV];
    self.var_selectedIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    [self.var_rightContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset(0);
        make.width.mas_equalTo(360);
    }];
    
    [self.gradientContainerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.episodesL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.gradientContainerV).offset(50);
        make.leading.mas_equalTo(self.gradientContainerV).offset(50);
        make.size.mas_equalTo(CGSizeMake(70, 19));
    }];
    
    NSMutableArray *var_epsArray = @[].mutableCopy;
    for (int i = 0; i < self.dataArray.count; i++) {
        HTTVPlayDetailEpsListModel *model = self.dataArray[i];
        HTDropdownListItem *item = [[HTDropdownListItem alloc] initWithItem:[NSString stringWithFormat:@"%d", i] withName:kFormat(model.title).ht_isEmptyStr];
        [var_epsArray addObject:item];
    }
    HTDropdownListView *var_listView = [[HTDropdownListView alloc] initWithDataSource:var_epsArray];
    var_listView.selectIndex = 0;
    var_listView.textColor = [UIColor whiteColor];
    var_listView.var_selectedColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    var_listView.font = [UIFont systemFontOfSize:12.0f];
    var_listView.backgroundColor = [UIColor ht_colorWithHexString:@"#434360"];
    var_listView.layer.cornerRadius = 6;
    var_listView.clipsToBounds = YES;
    self.var_listView = var_listView;
    [self.gradientContainerV addSubview:var_listView];
    [var_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.gradientContainerV).inset(24);
        make.size.mas_equalTo(CGSizeMake(110, 28));
        make.centerY.mas_equalTo(self.episodesL);
    }];
    kself
    [var_listView ht_setDropdownListViewSelectedBlock:^(HTDropdownListView *var_listView) {
        HTDropdownListItem *selectedItem = var_listView.var_selectedItem;
        [weakSelf ht_handleSwitchSeason:selectedItem];
    }];
    [var_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.gradientContainerV).inset(24);
        make.size.mas_equalTo(CGSizeMake(102, 28));
        make.centerY.mas_equalTo(self.episodesL);
    }];
    
    [self.gradientContainerV addSubview:self.lineV];
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.episodesL);
        make.trailing.mas_equalTo(self.gradientContainerV);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.episodesL.mas_bottom).offset(15);
    }];
    
    self.collectionV = [HTEpisodesControllerManager lgjeropj_collectionView:self];
    [self.gradientContainerV addSubview:self.collectionV];
    [self.collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.episodesL);
        make.top.mas_equalTo(self.lineV.mas_bottom).offset(24);
        make.trailing.mas_equalTo(self.gradientContainerV).inset(24);
        make.bottom.mas_equalTo(self.gradientContainerV).inset(41);
    }];
}

// 更新集数数据
- (void)ht_updateViewEpsListData:(NSMutableArray *)dataArray andCurrentModel:(HTTVPlayDetailEpsListModel *)var_currentEpsModel {
    self.var_epsArray = dataArray;
    self.var_currentEpsModel = var_currentEpsModel;
    [self.collectionV reloadData];
}

- (void)ht_handleSwitchSeason:(HTDropdownListItem *)selectedItem{
    NSInteger index = [selectedItem.var_itemId integerValue];
    if([self.delegate respondsToSelector:@selector(ht_switchSeason:)]){
        [self.delegate ht_switchSeason:index];
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
- (void)controlLayerNeedAppear:(__kindof MSBornPlume *)plume {
    int i = 0;
    for (; i < self.dataArray.count; i++) {
        HTTVPlayDetailEpsListModel *model = self.dataArray[i];
        if(model.isSelected){
            break;
        }
    }
    if(i < self.var_listView.dataSource.count){
        self.var_listView.selectIndex = i;
    }
}

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
            if ( [self.delegate respondsToSelector:@selector(ht_tappedBlankAreaOnTheControlLayer:)] ) {
                [self.delegate ht_tappedBlankAreaOnTheControlLayer:self];
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

#pragma mark -- UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.var_epsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HTEpisodesCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HTEpisodesCollectionCell class]) forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.item + 1];
    HTTVPlayDetailEpsListModel *model = self.var_epsArray[indexPath.row];
    if([model.var_idNum isEqualToString:self.var_currentEpsModel.var_idNum]){
        [cell ht_changeCellBgClolor:YES];
    }else{
        [cell ht_changeCellBgClolor:NO];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.var_selectedIndexPath = indexPath;
    HTTVPlayDetailEpsListModel *model = self.var_epsArray[indexPath.row];
    if([self.delegate respondsToSelector:@selector(ht_didSelectedEpsWithData:indexPath:)]){
        [self.delegate ht_didSelectedEpsWithData:model indexPath:indexPath];
    }
}

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 14;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 14;
}

- (NSMutableArray *)dArray{
    if(!_dArray){
        _dArray = @[].mutableCopy;
    }
    return _dArray;
}

@end

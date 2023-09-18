//
//  HTMovieCollectionView.m
// 
//
//  Created by Apple on 2023/3/3.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTMovieCollectionView.h"
#import "HTMovieHeaderCollectionCell.h"
#import "HTHomeCollectionHeaderView.h"
#import "HTHomeHorizontalCell.h"
#import "ZKCustomLayout.h"
#import "HTMoviePlayDetailModel.h"
#import "HTMovieHomeDefaultSetDataListSubListModel.h"
#import "HTMovieHomeDefaultSetDataListSubListMovieModel.h"

@interface HTMovieCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) HTMoviePlayDetailModel *var_dataModel;

@end

@implementation HTMovieCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self lgjeropj_setupSubviews];
    }
    
    return self;
}

- (void)lgjeropj_setupSubviews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    // register collection header
    [collectionView registerClass:[HTMovieHeaderCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HTMovieHeaderCollectionCell class])];
    // register section header
    [collectionView registerClass:[HTHomeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HTHomeCollectionHeaderView class])];
    // register cell
    [collectionView registerClass:[HTHomeHorizontalCell class] forCellWithReuseIdentifier:NSStringFromClass([HTHomeHorizontalCell class])];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.alwaysBounceVertical = YES;
    [self addSubview:collectionView];
    self.collectionV = collectionView;
    [self.collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)ht_updateViewWithData:(HTMoviePlayDetailModel *)var_dataModel{
    self.var_dataModel = var_dataModel;
    
    [self.collectionV reloadData];
}

#pragma mark -- collectionView Delegate & collectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(!self.var_dataModel){
        return 0;
    }
    return self.var_dataModel.dataArray.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else if (section == 1){
        return self.var_dataModel.dataArray.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // header
        HTMovieHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HTMovieHeaderCollectionCell class]) forIndexPath:indexPath];
        [cell ht_updateViewWithData:self.var_dataModel];
        cell.BLOCK_operationButtonBlock = self.BLOCK_operationButtonBlock;
        kself
        cell.BLOCK_arrowDownButtonActionBlock = ^(BOOL var_isDown) {
            weakSelf.var_dataModel.var_detailMore = var_isDown;
            [weakSelf.collectionV reloadData];
        };
        return cell;
    } else {
        HTHomeHorizontalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HTHomeHorizontalCell class]) forIndexPath:indexPath];
        HTMovieHomeDefaultSetSectionModel *model = [self.var_dataModel.dataArray objectAtIndex:indexPath.section-1];
        cell.isNotAllowLoad = YES;
        HTMovieHomeDefaultSetDataListSubListModel *aModel = (HTMovieHomeDefaultSetDataListSubListModel *)model.data.firstObject;
        [cell ht_updateCellWithData:aModel.dataArray andSectionModel:model andSelectedBlock:^(HTMovieHomeDefaultSetSectionModel * _Nonnull sectionModel, HTMovieHomeDefaultSetDataListSubListMovieModel *var_dataModel) {
            if(self.BLOCK_HTMovieCollectionViewSelectedBlock){
                self.BLOCK_HTMovieCollectionViewSelectedBlock(sectionModel, var_dataModel);
            }
        }];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section > 0){
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            HTMovieHomeDefaultSetSectionModel *var_sectionModel = [self.var_dataModel.dataArray objectAtIndex:indexPath.section-1];
            HTHomeCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HTHomeCollectionHeaderView class]) forIndexPath:indexPath];
            [header ht_updateViewWithData:var_sectionModel andDoneBlock:^(HTMovieHomeDefaultSetSectionModel * _Nonnull model, ENUM_HTCollectionHeaderFooterButtonType buttonType) {

            }];
            if(var_sectionModel.displayType == ENUM_HTHomeSectionTypeBnner){
                [header ht_hideContentView];
            }else if(var_sectionModel.displayType == ENUM_HTHomeSectionTypeAdview){
                [header ht_hideContentView];
            }
            return header;
        }
    }
    return [UICollectionReusableView new];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if(self.var_dataModel.var_detailMore){
            return CGSizeMake(SCREEN_WIDTH, self.var_dataModel.var_detailHeight);
        }else{
            return CGSizeMake(SCREEN_WIDTH, self.var_dataModel.var_starsHeight);
        }
    } else {
        return CGSizeMake(SCREEN_WIDTH, (kDevice_Is_iPad ? HTScaleHeight(0.7, (SCREEN_WIDTH - 10 * 4)/3/7*10)+30 : (SCREEN_WIDTH - 10 * 4)/3/7*10+30));
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(ZKCustomLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return CGSizeZero;
    }else{
        HTMovieHomeDefaultSetSectionModel *var_sectionModel = [self.var_dataModel.dataArray objectAtIndex:section-1];
        if(var_sectionModel.displayType == ENUM_HTHomeSectionTypeBnner){
            return CGSizeZero;
        }else if(var_sectionModel.displayType == ENUM_HTHomeSectionTypeAdview){
            return CGSizeZero;
        }else{
            return CGSizeMake(SCREEN_WIDTH, 42);
        }
    }
}

@end

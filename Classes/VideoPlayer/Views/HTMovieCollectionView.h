//
//  HTMovieCollectionView.h
// 
//
//  Created by Apple on 2023/3/3.
//  Copyright © 2023 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMoviePlayDetailModel.h"
#import "HTMovieHomeDefaultSetDataListSubListMovieModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMovieCollectionView : UIView

@property (nonatomic, copy) void(^BLOCK_operationButtonBlock)(UIButton *sender);//简介下操作回调
@property (nonatomic, copy) void(^BLOCK_HTMovieCollectionViewSelectedBlock)(HTMovieHomeDefaultSetSectionModel *var_sectionModel, HTMovieHomeDefaultSetDataListSubListMovieModel *var_dataModel);//list点击回调

- (void)ht_updateViewWithData:(HTMoviePlayDetailModel *)var_dataModel;

@end

NS_ASSUME_NONNULL_END

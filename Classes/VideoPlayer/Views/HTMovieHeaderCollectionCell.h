//
//  HTMovieHeaderCollectionCell.h
// 
//
//  Created by Apple on 2023/3/3.
//  Copyright © 2023 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HTMoviePlayDetailModel;
@interface HTMovieHeaderCollectionCell : UICollectionViewCell

@property (nonatomic, copy) void(^BLOCK_arrowDownButtonActionBlock)(BOOL var_isDown);
@property (nonatomic, copy) void(^BLOCK_operationButtonBlock)(UIButton *sender);

- (void)ht_updateViewWithData:(HTMoviePlayDetailModel *)data;

@end

NS_ASSUME_NONNULL_END

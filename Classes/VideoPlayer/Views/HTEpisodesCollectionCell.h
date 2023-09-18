//
//  HTEpisodesCollectionCell.h
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTEpisodesCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel * titleLabel;

- (void)ht_changeCellBgClolor:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END

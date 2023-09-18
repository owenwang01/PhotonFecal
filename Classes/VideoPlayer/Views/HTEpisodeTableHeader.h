//
//  HTEpisodeTableHeader.h
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTVPlayDetailSSNModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^BLOCK_HTSwitchEpsSeasonBlock)(NSString *seasonId, NSInteger selectedIndex);

@interface HTEpisodeTableHeader : UIView
@property (nonatomic, copy) BLOCK_HTSwitchEpsSeasonBlock BLOCK_HTSwitchEpsSeason;

- (instancetype)initWithFrame:(CGRect)frame andType:(NSInteger)var_videoType;

- (void)ht_updateHeaderWithData:(HTTVPlayDetailSSNModel *)data;

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex;

@end

NS_ASSUME_NONNULL_END

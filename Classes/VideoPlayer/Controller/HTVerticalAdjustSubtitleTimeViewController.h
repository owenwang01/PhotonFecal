//
//  HTVerticalAdjustSubtitleTimeViewController.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class MSPlume;
@interface HTVerticalAdjustSubtitleTimeViewController : HTBaseViewController

@property (nonatomic, weak) MSPlume *player;

@property (nonatomic, copy) void(^BLOCK_adjustButtonActionBlock)(NSInteger type);

@end

NS_ASSUME_NONNULL_END

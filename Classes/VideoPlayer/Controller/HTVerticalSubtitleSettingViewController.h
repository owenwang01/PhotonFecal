//
//  HTVerticalSubtitleSettingViewController.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^BLOCK_HTVerticalSubtitleBlock)(BOOL tag);

@class MSPlume;
@protocol HTSwitchLanguageViewControllerDelegate, HTAdjustSubtitleTimeViewControllerDelegate;
@interface HTVerticalSubtitleSettingViewController : HTBaseViewController

@property (nonatomic, weak) id<HTSwitchLanguageViewControllerDelegate> delegate;
@property (nonatomic, weak) id<HTAdjustSubtitleTimeViewControllerDelegate> var_timeDelegate;
@property (nonatomic, strong) NSArray *subtitles;
@property (nonatomic, strong) NSMutableArray *var_subtitleData;
@property (nonatomic, weak) MSPlume *player;
@property (nonatomic, copy) BLOCK_HTVerticalSubtitleBlock subtitleBlock;

- (void)ht_cancelSetting;
@end

NS_ASSUME_NONNULL_END

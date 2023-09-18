//
//  HTSwitchLanguageViewController.h
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTSwitchLanguageCell.h"
#import "HTSubtitleModel.h"

@protocol HTSwitchLanguageViewControllerDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface HTSwitchLanguageViewController : HTBaseViewController<MSControlLayer>
@property (nonatomic, strong) NSArray *subtitles;
@property (nonatomic, weak, nullable) id<HTSwitchLanguageViewControllerDelegate> delegate;
@end

@protocol HTSwitchLanguageViewControllerDelegate <NSObject>
//
// 点击空白区域的回调
//
- (void)ht_switchLanguageLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer;

- (void)ht_switchLanguageLayerCellClick:(HTSubtitleModel *)langModel;

@end

NS_ASSUME_NONNULL_END

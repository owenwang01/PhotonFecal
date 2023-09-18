//
//  HTAdjustSubtitleTimeViewController.h
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTAdjustCell.h"

@protocol HTAdjustSubtitleTimeViewControllerDelegate;

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ENUM_AdjustButtonClick_Last  = 150,
    ENUM_AdjustButtonClick_Minus,
    ENUM_AdjustButtonClick_Reset,
    ENUM_AdjustButtonClick_Plus,
    ENUM_AdjustButtonClick_Next,
} ENUM_AdjustButtonClickType;

@interface HTAdjustSubtitleTimeViewController : HTBaseViewController<MSControlLayer>

@property (nonatomic, weak, nullable) id<HTAdjustSubtitleTimeViewControllerDelegate> delegate;

@end

@protocol HTAdjustSubtitleTimeViewControllerDelegate <NSObject>
// 点击空白区域的回调
- (void)ht_adjustLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer;

// 字幕时间操作按钮的回调
- (void)ht_adjustLayerTimeWithType:(ENUM_AdjustButtonClickType)type;

@end

NS_ASSUME_NONNULL_END

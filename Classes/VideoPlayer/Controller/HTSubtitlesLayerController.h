//
//  HTSubtitlesLayerController.h
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTSubtitlesLayerCell.h"

@protocol HTSubtitlesLayerControllerDelegate;



NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
        ENUM_LayerType_SwitchLanguage,
        ENUM_LayerType_AdjustTime,
} ENUM_SubtitlesLayerType;

@interface HTSubtitlesLayerController : HTBaseViewController<MSControlLayer>
@property (nonatomic, weak, nullable) id<HTSubtitlesLayerControllerDelegate> delegate;
@end

@protocol HTSubtitlesLayerControllerDelegate <NSObject>
//
// 点击空白区域的回调
//
- (void)ht_subtitlesLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer;

- (void)ht_subtitlesLayerClickAction:(ENUM_SubtitlesLayerType)type;

- (void)ht_subtitlesLayerSwitchBtnAction:(BOOL)isOn;

@end

NS_ASSUME_NONNULL_END

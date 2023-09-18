//
//  HTFullScreenPlayButtons.h
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ENUM_HTFullScreenButtonType) {
    ENUM_HTFullScreenButtonTypeBack = 0, //快退10秒
    ENUM_HTFullScreenButtonTypePlayPause,//暂停/播放
    ENUM_HTFullScreenButtonTypeForward,  //快进10秒
};

typedef void(^BLOCK_HTPlayButtonBlock)(ENUM_HTFullScreenButtonType type);

@interface HTFullScreenPlayButtons : UIView

@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, copy) BLOCK_HTPlayButtonBlock playBtnBlock;


- (void)show;

- (void)dismissAnimate:(BOOL)animate;

- (void)switchPlayButtonStatus:(BOOL)isPlay;

@end

NS_ASSUME_NONNULL_END

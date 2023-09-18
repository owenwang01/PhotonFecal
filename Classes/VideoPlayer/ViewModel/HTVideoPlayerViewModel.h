//
//  HTVideoPlayerViewModel.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKAlertView.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ENUM_HTVideoType);

@class HTSubTitlesUtils, HTMoviePlayerViewModel, HTTVPlayerViewModel;
@interface HTVideoPlayerViewModel : NSObject

- (instancetype)init NS_REQUIRES_SUPER;
+ (instancetype)new NS_UNAVAILABLE;

//资源相关
@property (nonatomic, copy) NSString *videoId;//电视剧/电影资源ID
@property (nonatomic, assign) ENUM_HTVideoType type;

//字幕
@property (nonatomic, strong) RACCommand *var_requestSubtitles;
@property (nonatomic, strong) RACCommand *var_loadSubtitles;
@property (nonatomic, strong) RACCommand *var_saveHistory;
@property (nonatomic, strong) NSArray *subtitles;
@property (nonatomic, strong) NSMutableArray *var_subtitleData;
@property (nonatomic, strong) HTSubTitlesUtils *var_subTitleUtils;

//广告
@property (nonatomic, assign) NSTimeInterval var_rewardAdSec;//激励广告时间
@property (nonatomic, assign) NSTimeInterval var_bannerAdSec;//横屏顶部Banner广告弹出定时

@property (nonatomic, assign) NSTimeInterval var_bannerAdAutoHiden;//横屏顶部Banner自动隐藏的间隔时间,

//播放记录保存使用-保存时才会赋值
@property (nonatomic, assign) NSTimeInterval currentTime;//当前时间
@property (nonatomic, assign) NSTimeInterval duration;//总时间

@property (nonatomic, assign) BOOL var_playLock;//是否锁电影
@property (nonatomic, assign) BOOL var_playIsLocked;//是否已经锁过
@property (nonatomic, assign) NSTimeInterval var_lockTime;//锁电影时间


- (ZKAlertView *)ht_showLockAlertWithView:(UIView *)view andMovieData:(HTMoviePlayerViewModel *)var_dataModel andDoneBlock:(void(^)(BOOL success))var_doneBlock andCloseBlock:(void(^)(void))var_closeBlock;

- (ZKAlertView *)ht_showLockAlertWithView:(UIView *)view andTvData:(HTTVPlayerViewModel *)var_dataModel andDoneBlock:(void(^)(BOOL success))var_doneBlock andCloseBlock:(void(^)(void))var_closeBlock;

@end

NS_ASSUME_NONNULL_END

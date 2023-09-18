//
//  HTVideoPlayerViewModel.h
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import <Foundation/Foundation.h>
#import "HTMoviePlayerViewModel.h"
#import "HTTVPlayerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ENUM_HTVideoType);
@interface HTVideoPlayerControllerModel : NSObject

@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, assign) ENUM_HTVideoType type;
@property (nonatomic, assign) NSInteger var_source;


@property (nonatomic, assign) BOOL isForceScreen;
@property (nonatomic, assign) MSOrientation curforceOrientation;
@property (nonatomic, assign) BOOL isFullScreen;
@property (nonatomic, assign) BOOL isDefaultEdgeControlLayer;
@property (nonatomic, assign) BOOL var_continue;
@property (nonatomic, assign) BOOL isLock;
@property (nonatomic, assign) BOOL isShare;
@property (nonatomic, assign) BOOL isRemoveAd;
@property (nonatomic, assign) NSInteger lockTapCount;
@property (nonatomic, strong) NSMutableArray *rewardAdCheckArray;

@property (nonatomic, assign) BOOL var_showSubtitle;
// ViewModel
@property (nonatomic, strong) HTMoviePlayerViewModel *movieViewModel;
@property (nonatomic, strong) HTTVPlayerViewModel *tvViewModel;

@property (nonatomic, strong, nullable) NSDate *startTime;
@property (nonatomic, assign) NSInteger var_isPlaySuccess;
@property (nonatomic, assign) CGFloat var_total;//总时长
@property (nonatomic, strong, nullable) NSDate *var_cache1;//开始缓冲时间
@property (nonatomic, strong, nullable) NSDate *var_cache2;//结束缓冲时间
@property (nonatomic, strong, nullable) NSDate *var_linkTime1;//开始获取播放连接时间
@property (nonatomic, strong, nullable) NSDate *var_linkTime2;//结束获取播放连接时间
@property (nonatomic, assign) NSInteger var_isBackground;//是否进入过后台 1 是 2否
@property (nonatomic, assign) NSInteger var_isFirstPlay;
// 切集或者选集时会触发暂停回调 不弹原生广告
@property (nonatomic, assign) BOOL var_firstPlay;

- (void)lgjeropj_reportMTPlayShow;

- (void)lgjeropj_clickMTWithKid:(NSString *)kidStr;

- (void)lgjeropj_playtimeReport;

@end

NS_ASSUME_NONNULL_END

//
//  MSFullscreenModeStatusBar.h
//  Pods
//
//  Created by admin on 2019/12/11.
//

#import <UIKit/UIKit.h>
#import "MSFullscreenModeStatusBarDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface MSFullscreenModeStatusBar : UIView<MSFullscreenModeStatusBar>
///
/// 网络连接类型(无网络, 蜂窝网络, Wi-Fi)
///
@property (nonatomic) MSNetworkStatus networkStatus;

///
/// 系统当前时间
///
@property (nonatomic, strong, nullable) NSDate *date;

///
/// 电池状态
///
@property (nonatomic) UIDeviceBatteryState batteryState;

///
/// 电量
///
@property (nonatomic) float batteryLevel;
@end
NS_ASSUME_NONNULL_END

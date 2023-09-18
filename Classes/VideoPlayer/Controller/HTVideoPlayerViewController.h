//
//  HTVideoPlayerViewController.h
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ENUM_HTVideoType);
@interface HTVideoPlayerViewController : HTBaseViewController

@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, assign) ENUM_HTVideoType type;

@property (nonatomic, assign) NSInteger var_source;

- (void)lgjeropj_start;
- (void)lgjeropj_pause;

@end

NS_ASSUME_NONNULL_END

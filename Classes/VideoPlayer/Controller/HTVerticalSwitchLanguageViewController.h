//
//  HTVerticalSwitchLanguageViewController.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTSubtitleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTVerticalSwitchLanguageViewController : HTBaseViewController

@property (nonatomic, strong) NSArray *subtitles;

@property (nonatomic, copy) void(^BLOCK_selectSubtitleBlock)(HTSubtitleModel *model);

@end

NS_ASSUME_NONNULL_END

//
//  HTMoviePlayMaskView.h
// 
//
//  Created by Apple on 2023/3/4.
//  Copyright © 2023 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface HTMoviePlayMaskView : UIView

@property (nonatomic, copy) void(^BLOCK_buttonActionBlock)(UIButton *sender);

- (void)ht_updateAdView;

@end

NS_ASSUME_NONNULL_END

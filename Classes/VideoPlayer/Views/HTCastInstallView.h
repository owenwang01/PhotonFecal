//
//  HTCastInstallView.h
//  Axcolly
//
//  Created by 李雪健 on 2023/6/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTCastInstallView : UIControl

@property (nonatomic, copy) void (^block) (NSInteger type);

- (void)lgjeropj_show:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

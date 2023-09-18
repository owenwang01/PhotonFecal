







#import "FreDeftEverlastViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class MSPlume;
@interface VrStairliftInfluxViewController : FreDeftEverlastViewController

@property (nonatomic, weak) MSPlume *player;

@property (nonatomic, copy) void(^sgSpecificRuleBlock)(NSInteger type);

@end

NS_ASSUME_NONNULL_END

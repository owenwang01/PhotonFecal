







#import "AirflowDeflateMango.h"

@implementation AirflowDeflateMango

- (instancetype)initWithFrame:(CGRect)trunctLoss
{
    self = [super initWithFrame:trunctLoss];
    if (self) {
        [self addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickAction
{
    if (self.xpndEquipmentHangBlock) {
        self.xpndEquipmentHangBlock(self);
    }
}

@end
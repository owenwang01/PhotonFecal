






#import "MckEngagedSwollen.h"

@implementation MckEngagedSwollen

+ (MckEngagedSwollen *)barefacedAwakeTested {

    static MckEngagedSwollen *config = nil;
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        config = [[MckEngagedSwollen alloc] init];
    });
    return config;
}

@end
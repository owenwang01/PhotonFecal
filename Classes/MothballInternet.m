







#import "MothballInternet.h"

@implementation MothballInternet

- (instancetype)initWithItem:(NSString*)roomCnflct withName:(NSString*)subscrptCord {
    self = [super init];
    if (self) {
        _wrSqueezeOnce = roomCnflct;
        _schmConsoleArea = subscrptCord;
    }
    return self;
}

- (instancetype)init {
    return [self initWithItem:nil withName:nil];
}

@end
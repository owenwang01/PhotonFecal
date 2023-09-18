







#import "VrCircumciseModel.h"

@implementation VrCircumciseModel

- (NSMutableArray *)subtitles {
    if (!_subtitles) {
        _subtitles = [NSMutableArray array];
    }
    return _subtitles;
}

@end
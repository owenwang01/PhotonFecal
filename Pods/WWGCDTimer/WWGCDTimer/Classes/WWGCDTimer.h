
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WWGCDTimer : NSObject

+ (WWGCDTimer *)sharedInstance;

- (void)scheduledWithIdentifier:(NSString *)string
                   timeInterval:(double)interval
                          queue:(dispatch_queue_t _Nullable)queue
                        repeats:(BOOL)repeats
                         action:(dispatch_block_t)dispatchBlock;

- (void)cancel:(NSString *)string;

@end

NS_ASSUME_NONNULL_END


#import "WWGCDTimer.h"

@interface WWGCDTimer ()

@property (nonatomic, strong) NSMutableDictionary *timerContainer;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation WWGCDTimer

- (NSMutableDictionary *)timerContainer {
    
    if (!_timerContainer) {
        _timerContainer = [NSMutableDictionary dictionary];
    }
    return _timerContainer;
}

+ (WWGCDTimer *)sharedInstance {
    static WWGCDTimer *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [[WWGCDTimer alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t queue = dispatch_queue_create("com.WWGCDTimer.queue", attr);
        _queue = queue;
    }
    return self;
}

- (void)scheduledWithIdentifier:(NSString *)string
                   timeInterval:(double)interval
                          queue:(dispatch_queue_t)queue
                        repeats:(BOOL)repeats
                         action:(dispatch_block_t)dispatchBlock {
    
    if (!string || string.length == 0 || !dispatchBlock) return;
    if (queue == nil) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    dispatch_barrier_async(self.queue, ^{
        dispatch_source_t timer = [self.timerContainer objectForKey:string];
        if (!timer) {
            timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
            [self.timerContainer setObject:timer forKey:string];
            dispatch_resume(timer);
        }
        dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0.01 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            if (!repeats) {
                [self.timerContainer removeObjectForKey:string];
                dispatch_source_cancel(timer);
            }
            dispatchBlock();
        });
    });
}

- (void)cancel:(NSString *)string {
    
    dispatch_barrier_async(self.queue, ^{
        dispatch_source_t timer = [self.timerContainer objectForKey:string];
        if (!timer) {
            return;
        }
        [self.timerContainer removeObjectForKey:string];
        dispatch_source_cancel(timer);
    });
}

@end

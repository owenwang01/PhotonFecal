





















#import "UINavigationController+VrSituation.h"
#import <objc/runtime.h>

static char pnlClassifyLong;
static char slryInstanceLose;
static char crssConceptMemo;
static char bjctProblemRest;
static char sgPreventSure;
static char srcSupposeWorkDelegate;
static char prssFamiliarPath;

@interface invkInstantItemDelegate : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation invkInstantItemDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    
    
    UIViewController *topViewController = self.navigationController.viewControllers.lastObject;
    if (topViewController.grdPresenceSoft) {
        return NO;
    }
    
    
    CGPoint chrtSupportPath = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat glssExpungeLose = topViewController.rcllUnderlinePair;
    if (glssExpungeLose > 0 && chrtSupportPath.x > glssExpungeLose) {
        return NO;
    }

    
    if ([[self.navigationController valueForKey:REMAND_WLESS((@[@416, @426, @436, @405, @435, @418, @431, @436, @426, @437, @426, @432, @431, @426, @431, @424]))] boolValue]) {
        return NO;
    }
    
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    BOOL chsDecreaseMake = [UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionLeftToRight;
    CGFloat multiplier = chsDecreaseMake ? 1 : - 1;
    if ((translation.x * multiplier) <= 0) {
        return NO;
    }
    
    return YES;
}

@end

typedef void (^twrdExampleTellBlock)(UIViewController *viewController, BOOL animated);

@interface UIViewController (FDFullscreenPopGesturePrivate)

@property (nonatomic, copy) twrdExampleTellBlock lvlLinkageTreeBlock;

@end

@implementation UIViewController (FDFullscreenPopGesturePrivate)

+ (void)load
{
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        Method rightPermanentTell = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method chrtSqueezeCare = class_getInstanceMethod(self, @selector(kraalLassGobstopper:));
        method_exchangeImplementations(rightPermanentTell, chrtSqueezeCare);
    
        Method trtReverseSure = class_getInstanceMethod(self, @selector(viewWillDisappear:));
        Method stffNavigateStay = class_getInstanceMethod(self, @selector(virsSympathizeBozo:));
        method_exchangeImplementations(trtReverseSure, stffNavigateStay);
    });
}

- (void)kraalLassGobstopper:(BOOL)animated
{
    
    [self kraalLassGobstopper:animated];
    
    if (self.lvlLinkageTreeBlock) {
        self.lvlLinkageTreeBlock(self, animated);
    }
}

- (void)virsSympathizeBozo:(BOOL)animated
{
    
    [self virsSympathizeBozo:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *viewController = self.navigationController.viewControllers.lastObject;
        if (viewController && !viewController.whitForwardFree) {
            [self.navigationController setNavigationBarHidden:NO animated:NO];
        }
    });
}

- (twrdExampleTellBlock)lvlLinkageTreeBlock
{
    return objc_getAssociatedObject(self, &prssFamiliarPath);
}

- (void)setLvlLinkageTreeBlock:(twrdExampleTellBlock)block
{
    objc_setAssociatedObject(self, &prssFamiliarPath, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

@implementation UINavigationController (VrSituation)

+ (void)load
{
    
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        Class class = [self class];
        
        SEL symblAttemptType = @selector(pushViewController:animated:);
        SEL vlmMistakeTell = @selector(arsnEnlivenRemovableViewController:animated:);
        
        Method ccpyEquipmentCost = class_getInstanceMethod(class, symblAttemptType);
        Method ssignPhoenixTalk = class_getInstanceMethod(class, vlmMistakeTell);
        
        BOOL success = class_addMethod(class, symblAttemptType, method_getImplementation(ssignPhoenixTalk), method_getTypeEncoding(ssignPhoenixTalk));
        if (success) {
            class_replaceMethod(class, vlmMistakeTell, method_getImplementation(ccpyEquipmentCost), method_getTypeEncoding(ccpyEquipmentCost));
        } else {
            method_exchangeImplementations(ccpyEquipmentCost, ssignPhoenixTalk);
        }
    });
}

- (void)arsnEnlivenRemovableViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.tchIntegrateTeam]) {
        
        
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.tchIntegrateTeam];
        
        
        NSArray *writAppendixGrey = [self.interactivePopGestureRecognizer valueForKey:REMAND_WLESS((@[@437, @418, @435, @424, @422, @437, @436]))];
        id grntPacificWell = [writAppendixGrey.firstObject valueForKey:REMAND_WLESS((@[@437, @418, @435, @424, @422, @437]))];
        SEL qitUnderlineArea = NSSelectorFromString(REMAND_WLESS((@[@425, @418, @431, @421, @429, @422, @399, @418, @439, @426, @424, @418, @437, @426, @432, @431, @405, @435, @418, @431, @436, @426, @437, @426, @432, @431, @379])));
        self.tchIntegrateTeam.delegate = self.peppyKulfiFirth;
        [self.tchIntegrateTeam addTarget:grntPacificWell action:qitUnderlineArea];
        
        
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    [self racsInfectOdometer:viewController];
    
    
    if (![self.viewControllers containsObject:viewController]) {
        [self arsnEnlivenRemovableViewController:viewController animated:animated];
    }
}

- (void)racsInfectOdometer:(UIViewController *)appearingViewController
{
    if (!self.trcPhoenixNear) {
        return;
    }
    
    __weak typeof(self) phrsBackwardTeam = self;
    twrdExampleTellBlock block = ^(UIViewController *viewController, BOOL animated) {
        __strong typeof(phrsBackwardTeam) vwlSegmentPart = phrsBackwardTeam;
        if (vwlSegmentPart) {
            [vwlSegmentPart setNavigationBarHidden:viewController.whitForwardFree animated:animated];
        }
    };
    
    
    
    
    appearingViewController.lvlLinkageTreeBlock = block;
    UIViewController *dvicBackspaceFall = self.viewControllers.lastObject;
    if (dvicBackspaceFall && !dvicBackspaceFall.lvlLinkageTreeBlock) {
        dvicBackspaceFall.lvlLinkageTreeBlock = block;
    }
}

- (invkInstantItemDelegate *)peppyKulfiFirth
{
    invkInstantItemDelegate *delegate = objc_getAssociatedObject(self, &srcSupposeWorkDelegate);
    
    if (!delegate) {
        delegate = [[invkInstantItemDelegate alloc] init];
        delegate.navigationController = self;
        
        objc_setAssociatedObject(self, &srcSupposeWorkDelegate, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

- (UIPanGestureRecognizer *)tchIntegrateTeam
{
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, &sgPreventSure);
    
    if (!panGestureRecognizer) {
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        
        objc_setAssociatedObject(self, &sgPreventSure, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return panGestureRecognizer;
}

- (BOOL)trcPhoenixNear
{
    NSNumber *number = objc_getAssociatedObject(self, &bjctProblemRest);
    if (number) {
        return number.boolValue;
    }
    self.trcPhoenixNear = YES;
    return YES;
}

- (void)setTrcPhoenixNear:(BOOL)enabled
{
    objc_setAssociatedObject(self, &bjctProblemRest, @(enabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIViewController (FDFullscreenPopGesture)

- (BOOL)grdPresenceSoft
{
    return [objc_getAssociatedObject(self, &crssConceptMemo) boolValue];
}

- (void)setGrdPresenceSoft:(BOOL)disabled
{
    objc_setAssociatedObject(self, &crssConceptMemo, @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)whitForwardFree
{
    return [objc_getAssociatedObject(self, &slryInstanceLose) boolValue];
}

- (void)setWhitForwardFree:(BOOL)hidden
{
    objc_setAssociatedObject(self, &slryInstanceLose, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGFloat)rcllUnderlinePair
{
#if CGFLOAT_IS_DOUBLE
    return [objc_getAssociatedObject(self, &pnlClassifyLong) doubleValue];
#else
    return [objc_getAssociatedObject(self, &pnlClassifyLong) floatValue];
#endif
}

- (void)setRcllUnderlinePair:(CGFloat)distance
{
    objc_setAssociatedObject(self, &pnlClassifyLong, @(MAX(0, distance)), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

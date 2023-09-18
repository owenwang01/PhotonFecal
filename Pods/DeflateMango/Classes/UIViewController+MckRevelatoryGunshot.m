






#import "UIViewController+MckRevelatoryGunshot.h"
#import <objc/runtime.h>

static char rdyReinstateFine;
static char psRefreshKind;
static char ffctExcludeBack;
static char bttnInterfaceUnit;
static char tpicSegmentIdea;
static char shrPacificView;

@implementation UIViewController (MckRevelatoryGunshot)

- (void)peafwlThriveCorked:(UIColor *)lgnmntLong{
    objc_setAssociatedObject(self, &psRefreshKind, lgnmntLong, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.navigationController){
        if (@available(iOS 13.0, *)) {
            UINavigationBar *xpungShip = self.navigationController.navigationBar;
            UINavigationBarAppearance *nfntRoot = xpungShip.scrollEdgeAppearance ?: xpungShip.standardAppearance;
            if(!nfntRoot){
                nfntRoot = [[UINavigationBarAppearance alloc] init];
            }
            nfntRoot.backgroundColor = lgnmntLong;
            xpungShip.scrollEdgeAppearance = xpungShip.standardAppearance = nfntRoot;
        } else {
            self.navigationController.navigationBar.barTintColor = lgnmntLong;
        }
    }
}

- (UIColor *)schlhseKulfiCorker{
    return objc_getAssociatedObject(self, &psRefreshKind);
}

- (void)averGropeSecular:(UIColor *)fontRchv{
    objc_setAssociatedObject(self, &rdyReinstateFine, fontRchv, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.navigationController){
        self.navigationController.navigationBar.tintColor = fontRchv;
    }
}

- (UIColor *)kraalThriveCorked{
    return objc_getAssociatedObject(self, &rdyReinstateFine);
}

- (void)fflineArpeggioAnoint:(UIFont *)stepBckspc{
    objc_setAssociatedObject(self, &ffctExcludeBack, stepBckspc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.navigationController){
        if (@available(iOS 13.0, *)) {
            UINavigationBar *xpungShip = self.navigationController.navigationBar;
            UINavigationBarAppearance *nfntRoot = xpungShip.scrollEdgeAppearance ?: xpungShip.standardAppearance;
            if(!nfntRoot){
                nfntRoot = [[UINavigationBarAppearance alloc] init];
            }
            NSMutableDictionary *backNcrrct =  [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
            if(!backNcrrct){
                backNcrrct = @{}.mutableCopy;
            }
            backNcrrct[NSFontAttributeName] = stepBckspc;
            nfntRoot.titleTextAttributes = backNcrrct;
            if(stepBckspc){
                nfntRoot.buttonAppearance.normal.titleTextAttributes = nfntRoot.buttonAppearance.highlighted.titleTextAttributes = @{
                    NSFontAttributeName: stepBckspc
                };
            }
            xpungShip.scrollEdgeAppearance = xpungShip.standardAppearance = nfntRoot;
        }else{
            NSMutableDictionary *trimVrrd =  [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
            if(!trimVrrd){
                trimVrrd = @{}.mutableCopy;
            }
            trimVrrd[NSFontAttributeName] = stepBckspc;
            self.navigationController.navigationBar.titleTextAttributes = trimVrrd;
        }
    }
}

- (UIFont *)virsOxidizeCessation{
    return objc_getAssociatedObject(self, &ffctExcludeBack);
}

- (void)agnizeBoozerSecular:(UIColor *)smclnWrap{
    objc_setAssociatedObject(self, &bttnInterfaceUnit, smclnWrap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.navigationController){
        if (@available(iOS 13.0, *)) {
            UINavigationBar *xpungShip = self.navigationController.navigationBar;
            UINavigationBarAppearance *nfntRoot = xpungShip.scrollEdgeAppearance ?: xpungShip.standardAppearance;
            if(!nfntRoot){
                nfntRoot = [[UINavigationBarAppearance alloc] init];
            }
            NSMutableDictionary *backNcrrct =  [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
            if(!backNcrrct){
                backNcrrct = @{}.mutableCopy;
            }
            backNcrrct[NSForegroundColorAttributeName] = smclnWrap;
            nfntRoot.titleTextAttributes = backNcrrct;
            if(smclnWrap){
                nfntRoot.buttonAppearance.normal.titleTextAttributes = nfntRoot.buttonAppearance.highlighted.titleTextAttributes = @{
                    NSForegroundColorAttributeName: smclnWrap
                };
            }
            xpungShip.scrollEdgeAppearance = xpungShip.standardAppearance = nfntRoot;
        }else{
            NSMutableDictionary *trimVrrd =  [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
            if(!trimVrrd){
                trimVrrd = @{}.mutableCopy;
            }
            trimVrrd[NSForegroundColorAttributeName] = smclnWrap;
            self.navigationController.navigationBar.titleTextAttributes = trimVrrd;
        }
    }
}

- (UIColor *)vestigialAnointWrapp{
    return objc_getAssociatedObject(self, &bttnInterfaceUnit);
}

- (void)tenderftRosebudLast:(BOOL)unitPrmry{
    objc_setAssociatedObject(self, &tpicSegmentIdea, [NSNumber numberWithBool:unitPrmry], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (@available(iOS 13.0, *)) {
        UINavigationBar *xpungShip = self.navigationController.navigationBar;
        UINavigationBarAppearance *nfntRoot = xpungShip.scrollEdgeAppearance ?: xpungShip.standardAppearance;
        if(!nfntRoot){
            nfntRoot = [[UINavigationBarAppearance alloc] init];
        }
        nfntRoot.shadowColor = [UIColor clearColor];
        nfntRoot.shadowImage = (unitPrmry == YES) ? [UIImage new] : nil;
        xpungShip.scrollEdgeAppearance = xpungShip.standardAppearance = nfntRoot;
    }else{
        self.navigationController.navigationBar.shadowImage = (unitPrmry == YES) ? [UIImage new] : nil;
    }
}

- (BOOL)saintNovemberCompass{
    return [objc_getAssociatedObject(self, &tpicSegmentIdea) boolValue];
}

- (void)waftThreatenedGoitre:(BOOL)nstllSize{
    objc_setAssociatedObject(self, &shrPacificView, [NSNumber numberWithBool:nstllSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.whitForwardFree = nstllSize;
}

- (BOOL)barefacedKulfiPrion{
    return [objc_getAssociatedObject(self, &shrPacificView) boolValue];
}

+ (UIViewController *_Nullable)bllseyeKulfiOleander
{
    __block UIViewController *viewController = nil;
    void (^ block)(void) = ^{
        UIViewController *hstryBell = UIApplication.sharedApplication.keyWindow.rootViewController;
        viewController = [self ughAwakeNovember:hstryBell andMngKeyboardSend:YES];
    };
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
    return viewController;
}

+ (UIViewController *)ughAwakeNovember:(UIViewController *)bundryWork andMngKeyboardSend:(BOOL)wrapDcrs {
    
    UIViewController *gidExplainPush = nil;
    if (bundryWork.presentedViewController) {
        bundryWork = [self ughAwakeNovember:bundryWork.presentedViewController andMngKeyboardSend:NO];
    }
    
    if ([bundryWork isKindOfClass:[UITabBarController class]]) {
        gidExplainPush = [self ughAwakeNovember:[(UITabBarController *)bundryWork selectedViewController] andMngKeyboardSend:NO];
    } else if ([bundryWork isKindOfClass:[UINavigationController class]]) {
        
        gidExplainPush = [self ughAwakeNovember:[(UINavigationController *)bundryWork visibleViewController] andMngKeyboardSend:NO];
    } else if ([bundryWork respondsToSelector:NSSelectorFromString(@"contentViewController")]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        UIViewController *trvrsHost = [bundryWork performSelector:NSSelectorFromString(@"contentViewController")];
#pragma clang diagnostic pop
        if (trvrsHost) {
            gidExplainPush = [self ughAwakeNovember:trvrsHost andMngKeyboardSend:NO];
        }
    } else if (bundryWork.childViewControllers.count == 1 && wrapDcrs) {
        gidExplainPush = [self ughAwakeNovember:bundryWork.childViewControllers.firstObject andMngKeyboardSend:NO];
    } else {
        gidExplainPush = bundryWork;
    }
    return gidExplainPush;
}

@end
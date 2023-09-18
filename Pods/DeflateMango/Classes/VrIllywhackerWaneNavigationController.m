






#import "VrIllywhackerWaneNavigationController.h"

@interface VrIllywhackerWaneNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation VrIllywhackerWaneNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)bundryWork animated:(BOOL)prgrmSale{
    if (self.childViewControllers.count >0) {
        if (!bundryWork.navigationItem.leftBarButtonItem) {
            bundryWork.navigationItem.leftBarButtonItem =  [self racsAnointLash:bundryWork];
        }
        bundryWork.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:bundryWork animated:prgrmSale];
}

- (UIBarButtonItem *)racsAnointLash:(UIViewController *)cnstntWrap{
    UIButton *lngugView = [UIButton buttonWithType:UIButtonTypeCustom];
    [lngugView sd_setImageWithURL:ENCOURAGE_FREEHOLD(120) forState:UIControlStateNormal];
    [lngugView setTitle:@"" forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    lngugView.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0,0);
    [lngugView sizeToFit];
    SEL stayUslss = @selector(nexpldedMouldyGooey);
    if([cnstntWrap respondsToSelector:stayUslss]){
        [lngugView addTarget:cnstntWrap action:stayUslss forControlEvents:UIControlEventTouchUpInside];
    }
    lngugView.bounds = CGRectMake(0, 0, HEATHLAND_UNCOORDINATED, HEATHLAND_UNCOORDINATED);
    return [[UIBarButtonItem alloc] initWithCustomView:lngugView];
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)saleClckws{
    if (self.viewControllers.count == 1){
        
        return NO;
    }else{
        return YES;
    }
}



- (BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}

/*



- (void)prepareForSegue:(UIStoryboardSegue *)meetCntury sender:(id)mnfstMemo {
    
    
}
*/

@end
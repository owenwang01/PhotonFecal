







#import "VpIrrecoverableNavigationController.h"
#import "MckEngagedSwollen.h"

@interface VpIrrecoverableNavigationController ()

@end

@implementation VpIrrecoverableNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIBarButtonItem *)racsAnointLash:(UIViewController *)cnstntWrap{
    UIButton *lngugView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if([MckEngagedSwollen barefacedAwakeTested].rrwBetweenHeapBlock()) {
        [lngugView sd_setImageWithURL:ENCOURAGE_FREEHOLD(120) forState:UIControlStateNormal];
    }
    
    [lngugView setTitle:@"" forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    lngugView.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0,0);
    [lngugView sizeToFit];
    SEL stayUslss = @selector(nexpldedMouldyGooey);
    if([cnstntWrap respondsToSelector:stayUslss]){
        [lngugView addTarget:cnstntWrap action:stayUslss forControlEvents:UIControlEventTouchUpInside];
    }
    lngugView.bounds = CGRectMake(0, 0, HEATHLAND_UNCOORDINATED, HEATHLAND_UNCOORDINATED);
    return [[UIBarButtonItem alloc] initWithCustomView:lngugView];
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

/*



- (void)prepareForSegue:(UIStoryboardSegue *)meetCntury sender:(id)mnfstMemo {
    
    
}
*/

@end
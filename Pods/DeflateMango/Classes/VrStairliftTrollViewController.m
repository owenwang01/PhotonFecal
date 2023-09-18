






#import "VrStairliftTrollViewController.h"

@interface VrStairliftTrollViewController ()

@end

@implementation VrStairliftTrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.selectedViewController.supportedInterfaceOrientations;
}



@end
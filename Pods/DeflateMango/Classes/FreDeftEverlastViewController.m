







#import "FreDeftEverlastViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface FreDeftEverlastViewController ()

@end

@implementation FreDeftEverlastViewController

- (void)viewWillAppear:(BOOL)prgrmSale {
    [super viewWillAppear:prgrmSale];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor swipeScabiesNomad:@"#222232"];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (void)nerlgyLassMouldy {
    
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = NO;
    } else {
        
    }
    [self fflineArpeggioAnoint:[self virsOxidizeCessation] ?: [UIFont systemFontOfSize:20.0f]];
    [self agnizeBoozerSecular:[self vestigialAnointWrapp] ?: [UIColor whiteColor]];
    [self peafwlThriveCorked:[self schlhseKulfiCorker] ?: [UIColor swipeScabiesNomad:@"#303242"]];
    [self tenderftRosebudLast:YES];
}

- (void)setVilPredictText:(BOOL)thenCmpct{
    _vilPredictText = thenCmpct;
    
    if(self.navigationController){
        self.navigationItem.leftBarButtonItem = [self racsAnointLash:self];
    }
}

- (UIBarButtonItem *)racsAnointLash:(UIViewController *)cnstntWrap {
    UIButton *lngugView = [UIButton buttonWithType:UIButtonTypeCustom];
    [lngugView sd_setImageWithURL:ENCOURAGE_FREEHOLD(120) forState:UIControlStateNormal];
    [lngugView setTitle:@"" forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lngugView setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    lngugView.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0,0);
    
    SEL stayUslss = @selector(nexpldedMouldyGooey);
    if([cnstntWrap respondsToSelector:stayUslss]){
        [lngugView addTarget:cnstntWrap action:stayUslss forControlEvents:UIControlEventTouchUpInside];
    }
    lngugView.bounds = CGRectMake(0, 0, HEATHLAND_UNCOORDINATED*0.8, HEATHLAND_UNCOORDINATED*0.8);
    return [[UIBarButtonItem alloc] initWithCustomView:lngugView];
}

- (void)scfflSpammSkepticism{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)swankyClockHauteur{
    @weakify(self);
    self.rsnClockwiseDateView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.startIndex = 1;
        [self peafwlSatireViand];
    }];
}

- (void)ughPederastSatire{
    @weakify(self);
    self.rsnClockwiseDateView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        self.startIndex++;
        [self peafwlSatireViand];
    }];
    self.rsnClockwiseDateView.mj_footer.hidden = YES;
}

- (UIActivityIndicatorView *)nlgCellView {
    
    if (_nlgCellView == nil) {
        _nlgCellView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectZero];
        _nlgCellView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.view addSubview:_nlgCellView];
        [_nlgCellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.height.equalTo(@(50));
        }];
    }
    [self.view bringSubviewToFront:_nlgCellView];
    return _nlgCellView;
}

@end
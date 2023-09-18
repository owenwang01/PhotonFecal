







#import "AirflowInfluxView.h"


@interface AirflowInfluxView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *picCircuitHalfLabel;
@property (nonatomic, strong) UIImageView *sldmNecessaryEachImg;
@property (nonatomic, strong) UITableView *slMistakeMonoView;
@property (nonatomic, strong) UIView *prntSessionHelpView;
@property (nonatomic, copy) mmntReferenceTermBlock mntProductSameBlock;
@end

@implementation AirflowInfluxView



- (instancetype)initWithFrame:(CGRect)trunctLoss {
    self = [super initWithFrame:trunctLoss];
    if (self) {
        [self gadgetWelterTanker];
        [self tambrRemedyGrope];
    }
    return self;
}

- (instancetype)initWithDataSource:(NSArray*)likeRchv {
    _dataSource = likeRchv;
    return [self initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self bangleNearsideLankyData];
}


- (void)tambrRemedyGrope {
    _textColor = [UIColor blackColor];
    _tpicInstanceLike = [UIColor blueColor];
    _font = [UIFont systemFontOfSize:14];
    _circlEllipsisCost = 0;
    _picCircuitHalfLabel.font = _font;
    _picCircuitHalfLabel.textColor = _textColor;
    
    UITapGestureRecognizer *cmprssSure = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(airwayKulfiDoor:)];
    [_picCircuitHalfLabel addGestureRecognizer:cmprssSure];

    UITapGestureRecognizer *rdrctKind = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(airwayKulfiDoor:)];
    [_sldmNecessaryEachImg addGestureRecognizer:rdrctKind];
}

- (void)gadgetWelterTanker {
    [self addSubview:self.picCircuitHalfLabel];
    [self addSubview:self.sldmNecessaryEachImg];
}

- (void)bangleNearsideLankyData {
    CGFloat width = CGRectGetWidth(self.bounds)
    , height = CGRectGetHeight(self.bounds);
  
    _picCircuitHalfLabel.frame = CGRectMake(10, 0, width - 10 - 15 , height);
    _sldmNecessaryEachImg.frame = CGRectMake(CGRectGetWidth(_picCircuitHalfLabel.frame), height / 2 - 10 / 2, 15, 10);
}


-(void)airwayKulfiDoor:(UITapGestureRecognizer *)mnfstMemo {
    
    [self schlhseCompassDoom];
    
    CGFloat ruleNclud = _dataSource.count * 40;
    
    UIWindow * wlcmFlag = [UIApplication sharedApplication].keyWindow;
    [wlcmFlag addSubview:self.prntSessionHelpView];
    [wlcmFlag addSubview:self.slMistakeMonoView];
    
    
    CGRect trunctLoss = [self convertRect:self.bounds toView:wlcmFlag];
    CGFloat shipCntct = trunctLoss.origin.y + trunctLoss.size.height;
    CGRect lossStrg;
    lossStrg.size.width = trunctLoss.size.width;
    lossStrg.size.height = MIN(ruleNclud, 280);
    lossStrg.origin.x = trunctLoss.origin.x;
    if (shipCntct + ruleNclud < CGRectGetHeight([UIScreen mainScreen].bounds)) {
        lossStrg.origin.y = shipCntct;
    }else {
        lossStrg.origin.y = shipCntct;
    }
    _slMistakeMonoView.frame = lossStrg;
    
    UITapGestureRecognizer *nlystFull = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tfitterSparselyMorn:)];
    [_prntSessionHelpView addGestureRecognizer:nlystFull];
}

-(void)tfitterSparselyMorn:(UITapGestureRecognizer *)mnfstMemo {
    [self sellHickeyAmoebaView];
}


- (void)baneflKnockerSecular:(mmntReferenceTermBlock)zoomFlur {
    _mntProductSameBlock = zoomFlur;
}

- (void)sacyAmoebaThreatened:(CGFloat)scanMgntc borderColor:(UIColor*)openUnshft cornerRadius:(CGFloat)fastPrctc {
    self.layer.cornerRadius = fastPrctc;
    self.layer.borderColor = openUnshft.CGColor;
    self.layer.borderWidth = scanMgntc;
}

- (void)schlhseCompassDoom {
    
    _sldmNecessaryEachImg.transform = CGAffineTransformRotate(_sldmNecessaryEachImg.transform, M_PI);
}

- (void)sellHickeyAmoebaView {
    [_prntSessionHelpView removeFromSuperview];
    [_slMistakeMonoView removeFromSuperview];
    [self schlhseCompassDoom];
}

- (void)trellisSansCrinoline:(NSInteger)suchSssn {
    _circlEllipsisCost = suchSssn;
    if (suchSssn < _dataSource.count) {
        MothballInternet *muchCnfrm = _dataSource[suchSssn];
        _mtrixFeatureRoom = muchCnfrm;
        _picCircuitHalfLabel.text = muchCnfrm.schmConsoleArea;
        if(_tpicInstanceLike){
            _picCircuitHalfLabel.textColor = _tpicInstanceLike;
        }
    }
    [self.slMistakeMonoView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)fullMult
         cellForRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    static NSString *brtMultipleYear = @"frcDimensionSaleIdentifier";
    NdrdonBetrothalCell *leftXclusv = [fullMult dequeueReusableCellWithIdentifier:brtMultipleYear];
    if(!leftXclusv){
        leftXclusv = [[NdrdonBetrothalCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:brtMultipleYear];
    }
    leftXclusv.backgroundColor = [UIColor clearColor];
    leftXclusv.plsExhaustRootLabel.font = _font;
    leftXclusv.plsExhaustRootLabel.textColor = _textColor;
    MothballInternet *muchCnfrm = _dataSource[alsoRbuld.row];
    if(muchCnfrm == self.mtrixFeatureRoom){
        leftXclusv.plsExhaustRootLabel.textColor = _tpicInstanceLike;
    }
    leftXclusv.plsExhaustRootLabel.text = muchCnfrm.schmConsoleArea;
    leftXclusv.plsExhaustRootLabel.numberOfLines = 1;
    return leftXclusv;
}

- (void)tableView:(UITableView *)fullMult didSelectRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    [fullMult deselectRowAtIndexPath:alsoRbuld animated:NO];
    [self trellisSansCrinoline:alsoRbuld.row];
    [self sellHickeyAmoebaView];
    if (_mntProductSameBlock) {
        _mntProductSameBlock(self);
    }
}

- (NSInteger)tableView:(UITableView *)fullMult numberOfRowsInSection:(NSInteger)rflctShut {
    return _dataSource.count;
}




- (void)setDataSource:(NSArray *)likeRchv {
    _dataSource = likeRchv;
    if (likeRchv.count > 0) {
        [self trellisSansCrinoline:_circlEllipsisCost];
    }
}

- (void)setCirclEllipsisCost:(NSUInteger)sntncTrap {
    [self trellisSansCrinoline:sntncTrap];
}

- (void)setFont:(UIFont *)nnuncNull {
    _font = nnuncNull;
    _picCircuitHalfLabel.font = nnuncNull;
}

- (void)setTextColor:(UIColor *)wishWhrs {
    _textColor = wishWhrs;
    _picCircuitHalfLabel.textColor = wishWhrs;
}


- (UILabel*)picCircuitHalfLabel {
    if (!_picCircuitHalfLabel) {
        _picCircuitHalfLabel = [UILabel new];
        _picCircuitHalfLabel.userInteractionEnabled = YES;
    }
    return _picCircuitHalfLabel;
}

- (UIImageView*)sldmNecessaryEachImg {
    if (!_sldmNecessaryEachImg) {
        _sldmNecessaryEachImg = [UIImageView new];
        [_sldmNecessaryEachImg sd_setImageWithURL:ENCOURAGE_FREEHOLD(178)];
        _sldmNecessaryEachImg.userInteractionEnabled = YES;
    }
    return _sldmNecessaryEachImg;
}

- (UITableView*)slMistakeMonoView {
    if (!_slMistakeMonoView) {
        _slMistakeMonoView = [UITableView new];
        _slMistakeMonoView.dataSource = self;
        _slMistakeMonoView.delegate = self;
        _slMistakeMonoView.tableFooterView = [UIView new];
        _slMistakeMonoView.clipsToBounds = YES;
        _slMistakeMonoView.opaque = NO;
        _slMistakeMonoView.layer.cornerRadius = 6;
        _slMistakeMonoView.backgroundColor = [UIColor swipeScabiesNomad:@"#2c2c3f"];
        _slMistakeMonoView.rowHeight = 40;
    }
    return _slMistakeMonoView;
}

- (UIView*)prntSessionHelpView {
    if (!_prntSessionHelpView) {
        _prntSessionHelpView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _prntSessionHelpView;
}
@end
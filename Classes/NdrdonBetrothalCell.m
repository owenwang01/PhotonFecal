







#import "NdrdonBetrothalCell.h"

@implementation NdrdonBetrothalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)bootRdrct reuseIdentifier:(NSString *)giveNnunc{
    self = [super initWithStyle:bootRdrct reuseIdentifier:giveNnunc];
    if(self){
        [self typhnSkepticismWrapp];
    }
    return self;
}

- (void)typhnSkepticismWrapp{
    [self.contentView addSubview:self.plsExhaustRootLabel];
    [self.plsExhaustRootLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 5, 0, 0));
    }];
}

- (UILabel *)plsExhaustRootLabel{
    if (!_plsExhaustRootLabel) {
        _plsExhaustRootLabel = [[UILabel alloc] init];
        _plsExhaustRootLabel.text = @"";
        _plsExhaustRootLabel.textColor = [UIColor whiteColor];
    }
    return _plsExhaustRootLabel;
}

@end
//
//  EBDropdownList.m
//  DropdownListDemo
//
//  Created by Apple on 2022/4/17.
//  Copyright © 2022年 Apple. All rights reserved.
//

#import "HTDropdownListView.h"


@interface HTDropdownListView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *var_textLabel;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UITableView *tbView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, copy) BLOCK_ZKDropdownListViewSelectedBlock selectedBlock;
@end

@implementation HTDropdownListView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self ht_setupView];
        [self ht_setupProperty];
    }
    return self;
}

- (instancetype)initWithDataSource:(NSArray*)dataSource {
    _dataSource = dataSource;
    return [self initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self ht_setupFrame];
}

#pragma mark - Setup
- (void)ht_setupProperty {
    _textColor = [UIColor blackColor];
    _var_selectedColor = [UIColor blueColor];
    _font = [UIFont systemFontOfSize:14];
    _selectIndex = 0;
    _var_textLabel.font = _font;
    _var_textLabel.textColor = _textColor;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewExpand:)];
    [_var_textLabel addGestureRecognizer:tap1];

    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewExpand:)];
    [_arrowImg addGestureRecognizer:tap2];
}

- (void)ht_setupView {
    [self addSubview:self.var_textLabel];
    [self addSubview:self.arrowImg];
}

- (void)ht_setupFrame {
    CGFloat width = CGRectGetWidth(self.bounds)
    , height = CGRectGetHeight(self.bounds);
  
    _var_textLabel.frame = CGRectMake(10, 0, width - 10 - 15 , height);
    _arrowImg.frame = CGRectMake(CGRectGetWidth(_var_textLabel.frame), height / 2 - 10 / 2, 15, 10);
}

#pragma mark - Events
-(void)tapViewExpand:(UITapGestureRecognizer *)sender {
    
    [self rotateArrowImage];
    
    CGFloat var_tableHeight = _dataSource.count * 40;
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backView];
    [window addSubview:self.tbView];
    
    // 获取按钮在屏幕中的位置
    CGRect frame = [self convertRect:self.bounds toView:window];
    CGFloat var_tableViewY = frame.origin.y + frame.size.height;
    CGRect var_tableViewFrame;
    var_tableViewFrame.size.width = frame.size.width;
    var_tableViewFrame.size.height = MIN(var_tableHeight, 280);
    var_tableViewFrame.origin.x = frame.origin.x;
    if (var_tableViewY + var_tableHeight < CGRectGetHeight([UIScreen mainScreen].bounds)) {
        var_tableViewFrame.origin.y = var_tableViewY;
    }else {
        var_tableViewFrame.origin.y = var_tableViewY;
    }
    _tbView.frame = var_tableViewFrame;
    
    UITapGestureRecognizer *var_tagBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewDismiss:)];
    [_backView addGestureRecognizer:var_tagBackground];
}

-(void)tapViewDismiss:(UITapGestureRecognizer *)sender {
    [self removeBackgroundView];
}

#pragma mark - Methods
- (void)ht_setDropdownListViewSelectedBlock:(BLOCK_ZKDropdownListViewSelectedBlock)block {
    _selectedBlock = block;
}

- (void)ht_setViewBorder:(CGFloat)width borderColor:(UIColor*)borderColor cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}

- (void)rotateArrowImage {
    // 旋转箭头图片
    _arrowImg.transform = CGAffineTransformRotate(_arrowImg.transform, M_PI);
}

- (void)removeBackgroundView {
    [_backView removeFromSuperview];
    [_tbView removeFromSuperview];
    [self rotateArrowImage];
}

- (void)selectedItemAtIndex:(NSInteger)index {
    _selectIndex = index;
    if (index < _dataSource.count) {
        HTDropdownListItem *item = _dataSource[index];
        _var_selectedItem = item;
        _var_textLabel.text = item.var_itemName;
        if(_var_selectedColor){
            _var_textLabel.textColor = _var_selectedColor;
        }
    }
    [self.tbView reloadData];
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *STATIC_cellIdentifier = @"CELLString_HTDropDownListCell";
    HTDropDownListCell *cell = [tableView dequeueReusableCellWithIdentifier:STATIC_cellIdentifier];
    if(!cell){
        cell = [[HTDropDownListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:STATIC_cellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentLabel.font = _font;
    cell.contentLabel.textColor = _textColor;
    HTDropdownListItem *item = _dataSource[indexPath.row];
    if(item == self.var_selectedItem){
        cell.contentLabel.textColor = _var_selectedColor;
    }
    cell.contentLabel.text = item.var_itemName;
    cell.contentLabel.numberOfLines = 1;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self selectedItemAtIndex:indexPath.row];
    [self removeBackgroundView];
    if (_selectedBlock) {
        _selectedBlock(self);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}


#pragma mark - Setter

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count > 0) {
        [self selectedItemAtIndex:_selectIndex];
    }
}

- (void)setSelectIndex:(NSUInteger)selectedIndex {
    [self selectedItemAtIndex:selectedIndex];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _var_textLabel.font = font;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _var_textLabel.textColor = textColor;
}

#pragma mark - Getter
- (UILabel*)var_textLabel {
    if (!_var_textLabel) {
        _var_textLabel = [UILabel new];
        _var_textLabel.userInteractionEnabled = YES;
    }
    return _var_textLabel;
}

- (UIImageView*)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [UIImageView new];
        [_arrowImg sd_setImageWithURL:kImageNumber(178)];
        _arrowImg.userInteractionEnabled = YES;
    }
    return _arrowImg;
}

- (UITableView*)tbView {
    if (!_tbView) {
        _tbView = [UITableView new];
        _tbView.dataSource = self;
        _tbView.delegate = self;
        _tbView.tableFooterView = [UIView new];
        _tbView.clipsToBounds = YES;
        _tbView.opaque = NO;
        _tbView.layer.cornerRadius = 6;
        _tbView.backgroundColor = [UIColor ht_colorWithHexString:@"#2B2B3E"];
        _tbView.rowHeight = 40;
    }
    return _tbView;
}

- (UIView*)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _backView;
}
@end



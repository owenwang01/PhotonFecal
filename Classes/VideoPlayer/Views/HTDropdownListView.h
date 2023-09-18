//
//  EBDropdownList.h
//  DropdownListDemo
//
//  Created by Apple on 2022/4/17.
//  Copyright © 2022年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTDropDownListCell.h"
#import "HTDropdownListItem.h"

@class HTDropdownListView;

typedef void (^BLOCK_ZKDropdownListViewSelectedBlock)(HTDropdownListView *var_listView);
typedef void (^BLOCK_ClickSeasonBlock)(void);

@interface HTDropdownListView : UIView
// 字体颜色，默认 blackColor
@property (nonatomic, strong) UIColor *textColor;
// 选中字体颜色，默认 blueColor
@property (nonatomic, strong) UIColor *var_selectedColor;
// 字体默认14
@property (nonatomic, strong) UIFont *font;
// 数据源
@property (nonatomic, strong) NSArray *dataSource;
// 默认选中第一个
@property (nonatomic, assign) NSUInteger selectIndex;
// 当前选中的DropdownListItem
@property (nonatomic, strong, readonly) HTDropdownListItem *var_selectedItem;

- (instancetype)initWithDataSource:(NSArray*)dataSource;

- (void)ht_setViewBorder:(CGFloat)width borderColor:(UIColor*)borderColor cornerRadius:(CGFloat)cornerRadius;

- (void)ht_setDropdownListViewSelectedBlock:(BLOCK_ZKDropdownListViewSelectedBlock)block;

@end


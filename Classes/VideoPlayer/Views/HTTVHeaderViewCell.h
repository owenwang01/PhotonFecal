//
//  HTTVHeaderViewCell.h
// 
//
//  Created by Apple on 2023/3/4.
//  Copyright © 2023 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^BLOCK_HTSwitchEpsSeason)(NSString *seasonId, NSInteger selectedIndex);

@class HTTVPlayDetailSSNModel;
@interface HTTVHeaderViewCell : UITableViewCell
@property (nonatomic, copy) BLOCK_HTSwitchEpsSeason BLOCK_HTSwitchEpsSeason;//TODO:03-09bug


@property (nonatomic, copy) void(^BLOCK_arrowDownButtonActionBlock)(BOOL var_isDown);
@property (nonatomic, copy) void(^BLOCK_operationButtonBlock)(UIButton *sender);

- (void)ht_updateHeaderWithData:(HTTVPlayDetailSSNModel *)data;

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex;

@end

NS_ASSUME_NONNULL_END

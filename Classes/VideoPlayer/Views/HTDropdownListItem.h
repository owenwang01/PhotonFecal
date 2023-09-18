//
//  HTDropdownListItem.h
// 
//
//  Created by dn on 2023/1/29.
//  Copyright © 2023 admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTDropdownListItem : NSObject

@property (nonatomic, copy, readonly) NSString *var_itemId;
@property (nonatomic, copy, readonly) NSString *var_itemName;

- (instancetype)initWithItem:(NSString*)itemId withName:(NSString*)itemName NS_DESIGNATED_INITIALIZER;

@end


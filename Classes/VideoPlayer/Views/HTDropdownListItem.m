//
//  HTDropdownListItem.m
// 
//
//  Created by dn on 2023/1/29.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTDropdownListItem.h"

@implementation HTDropdownListItem

- (instancetype)initWithItem:(NSString*)var_itemId withName:(NSString*)var_itemName {
    self = [super init];
    if (self) {
        _var_itemId = var_itemId;
        _var_itemName = var_itemName;
    }
    return self;
}

- (instancetype)init {
    return [self initWithItem:nil withName:nil];
}

@end

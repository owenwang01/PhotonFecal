//
//  HTSubtitleModel.h
// 
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "FLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTSubtitleModel : FLBaseModel

@property (nonatomic, copy)   NSString *t_name;
@property (nonatomic, copy)   NSString *l_display;
@property (nonatomic, copy)   NSString *lang;
@property (nonatomic, copy)   NSString *sub;
@property (nonatomic, assign) NSInteger delay;
@property (nonatomic, assign) NSInteger forward;

@property (nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END

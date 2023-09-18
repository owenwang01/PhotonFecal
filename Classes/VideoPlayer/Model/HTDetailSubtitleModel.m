//
//  HTDetailSubtitleModel.m
// 
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTDetailSubtitleModel.h"

@implementation HTDetailSubtitleModel

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{AsciiString(@"subtitle") : [HTSubtitleModel class]};
}

@end

//
//  HTSubtitlesModel.m
// 
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubtitlesModel.h"

@implementation HTSubtitlesModel

- (NSMutableArray *)subtitles {
    if (!_subtitles) {
        _subtitles = [NSMutableArray array];
    }
    return _subtitles;
}

@end

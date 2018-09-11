//
//  NSTimer+Blocks.m
//  QT
//
//  Created by DavidYang on 16/4/5.
//  Copyright © 2016年 wliu. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer(Block)

+ (NSTimer *)rbScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        block:(void(^)())block
                                      repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
}


+ (void)blockInvoke:(NSTimer*)timer{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}
@end

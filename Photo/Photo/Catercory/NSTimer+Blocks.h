//
//  NSTimer+Blocks.h
//  QT
//
//  Created by DavidYang on 16/4/5.
//  Copyright © 2016年 wliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer(Block)



/**
 *  NSTimer Catetory
 *
 *  @param interval 
 *  @param block
 *  @param repeats  <#repeats description#>
 *
 *  @return  NSTimer Catetory
 */
+ (NSTimer *)rbScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;
@end

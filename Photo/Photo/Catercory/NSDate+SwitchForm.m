//
//  NSDate+SwitchForm.m
//  NestHouse
//
//  Created by shansander on 2017/7/12.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "NSDate+SwitchForm.h"

@implementation NSDate (SwitchForm)

+ (NSDate *)getDateFromString:(NSString *)date_string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"YYYY-MM-DD"];
    NSDate *dateTime = [formatter dateFromString:date_string];

    
    return dateTime;
}

@end

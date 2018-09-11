//
//  NSBundle+Version.m
//  freelancer
//
//  Created by DavidYang on 2016/9/13.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "NSBundle+Version.h"

@implementation NSBundle (Version)

+ (NSString*)releaseVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
}


+(NSString*)buildVersion{
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
}
@end

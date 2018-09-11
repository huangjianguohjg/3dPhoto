//
//  NSBundle+Version.h
//  freelancer
//
//  Created by DavidYang on 2016/9/13.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Version)

+ (NSString*)releaseVersion;

+(NSString*)buildVersion;

@end

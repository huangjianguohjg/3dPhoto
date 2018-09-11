//
//  HJGSaveTool.h
//  ChilEducation
//
//  Created by DH on 2017/7/31.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

//震动权限全局
#define ISZHEN       @"iszhen"          //震动权限定义
//声音权限
#define ISSHENG       @"isshengyin"     //声音权限定义

@interface HJGSaveTool : NSObject

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setValue:(id)value forKey:(NSString *)defaultName;

+ (id)valueForKey:(NSString *)defaultName;

+(void)removeObjectForKey:(NSString*)key;

+(void)clearAll;


@end

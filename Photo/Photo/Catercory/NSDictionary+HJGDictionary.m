//
//  NSDictionary+HJGDictionary.m
//  ChilEducation
//
//  Created by DH on 2017/9/17.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "NSDictionary+HJGDictionary.h"

@implementation NSDictionary (HJGDictionary)



//在.m文件中将声明的方法实现
- (NSArray *)nk_ascendingComparedAllKeys
{
    NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue] < [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return allKeys;
}

- (NSArray *)nk_descendingComparedAllKeys
{
    NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] < [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue] > [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return allKeys;
}


@end

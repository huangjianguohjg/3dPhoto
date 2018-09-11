//
//  FlLocalStoreManager.m
//  QT
//
//  Created by DavidYang on 16/4/25.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "FlLocalStoreManager.h"
#import "FCFileManager.h"

#define FlUserInfoPath                    @"HJGLoginBaseModel"

@implementation FlLocalStoreManager


#pragma mark -- user data

+ (HJGLoginBaseModel*)getUserInfo{
    
    NSString * path =[FCFileManager pathForDocumentsDirectoryWithPath:FlUserInfoPath];
    NSMutableArray * tempArr =[NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:path]];
    for(HJGLoginBaseModel * userInfo in tempArr){
       return userInfo;
    }
    return nil;
}

+ (void)saveUserInfo:(HJGLoginBaseModel*)userInfo{
    
    if(userInfo==nil){
        return;
    }
    NSString * path =[FCFileManager pathForDocumentsDirectoryWithPath:FlUserInfoPath];
    NSData * contentData = [NSData dataWithContentsOfFile:path];
    if(contentData==nil){
        return;
    }
    NSMutableArray * tempArr =[NSKeyedUnarchiver unarchiveObjectWithData:contentData];
    if (!tempArr) {
        tempArr = [NSMutableArray array];
    }
    [tempArr removeAllObjects];
    
    [tempArr addObject:userInfo];
    
    [self saveArr:tempArr withPath:path];
    
}

+ (void)removeUserInfo{
    
    NSString * path =[FCFileManager pathForDocumentsDirectoryWithPath:FlUserInfoPath];
    NSMutableArray * tempArr =[NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:path]];
    if (!tempArr) {
        tempArr = [NSMutableArray array];
    }
    [tempArr removeAllObjects];
    [self saveArr:tempArr withPath:path];
}

+ (BOOL)saveArr:(NSArray*)arr withPath:(NSString*)path{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
    
    return [data writeToFile:path atomically:YES];
}



#pragma mark -- default key value store

+ (void)setValueInDefault:(id)value withKey:(NSString *)key{
    
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:value];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


+ (id)getValueFromDefaultWithKey:(NSString *)key{
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    id value = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return value;
}

@end

 //
//  HJGNetManger.m
//  ChilEducation
//
//  Created by DH on 2017/8/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGNetManger.h"
#import "HJGTabBarController.h"
#import "AppDelegate.h"
#import <BADataEntity.h>
@implementation HJGNetManger

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)HJGGet:(NSString *)url IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    
    [HJGNetManger HJGGet:url withHost:@"" IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


+ (void)HJGGet:(NSString *)url withHost:(NSString*)host IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = [NSString stringWithFormat:@"%@%@",host,url];
        baData.needCache = NO;
        
        
        [BANetManager ba_request_GETWithEntity:baData successBlock:^(id response) {
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];


                
        } failureBlock:^(NSError *error) {
                
                failBlock(error);

                
        } progressBlock:nil];

}



+ (void)HJGPost:(NSString *)url withHost:(NSString*)host paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    

        BADataEntity *baData = [BADataEntity new];
        baData.urlString = [NSString stringWithFormat:@"%@%@",host,url];
        baData.parameters = dic;
        baData.needCache = NO;
        
        [BANetManager ba_request_POSTWithEntity:baData successBlock:^(id response) {
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];

                            successBlock(json[@"data"]);

                
        } failureBlock:^(NSError *error) {

                
                        failBlock(error);
        } progressBlock:nil];
        
}


+ (void)HJGPost:(NSString *)url paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

    [HJGNetManger HJGPost:url withHost:@"" paramDic:dic IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


//获取开奖数据
+ (void)getOpenAwardData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

     [self HJGGet:rArgument IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];

}


//通用get网络请求
+ (void)getCommenData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
    [self HJGGet:rArgument IsNeedCashe:NO responseSuccess:successBlock responseFail:failBlock];
}

//通用post网络请求
+ (void)postCommenData:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{

    [self HJGPost:rArgument paramDic:paraDic IsNeedCashe:cashe responseSuccess:successBlock responseFail:failBlock];
}


+ (void)panHidden:(HJGResponseSuccess)su Fail:(HJGResponseFail)fail{
   [self HJGGet:@"mob_safe" IsNeedCashe:NO responseSuccess:su responseFail:fail];
}



+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.needCache = NO;
        
        
        [BANetManager ba_request_GETWithEntity:baData successBlock:^(id response) {
//                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
//
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                
                                failBlock(error);
                
        } progressBlock:nil];
        
        
}

+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.parameters = paraDic;
        baData.needCache = NO;
        
        [BANetManager ba_request_POSTWithEntity:baData successBlock:^(id response) {
//                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
//
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                               failBlock(error);
        } progressBlock:nil];
        
}

@end

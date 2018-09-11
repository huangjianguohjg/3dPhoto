//
//  HJGNetManger.h
//  ChilEducation
//
//  Created by DH on 2017/8/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! 定义请求成功的 block */
typedef void( ^ HJGResponseSuccess)(id response);
/*! 定义请求失败的 block */
typedef void( ^ HJGResponseFail)(NSError *error);

@interface HJGNetManger : NSObject

/**
 *获取首页轮播数据
 *
 */
+ (void)getSlideshow:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;



+ (void)HJGGet:(NSString *)url withHost:(NSString*)host IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;

+ (void)HJGPost:(NSString *)url withHost:(NSString*)host paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;


/**
 *通用get数据数据
 *
 */
+ (void)getCommenData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;

/**
 *通用post数据数据
 *
 */
+ (void)postCommenData:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;

+ (void)panHidden:(HJGResponseSuccess)su Fail:(HJGResponseFail)fail;


/**
 *通用get数据数据
 *
 */
+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;

/**
 *通用post数据数据
 *
 */
+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;




@end

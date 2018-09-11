//
//  BaseDataConfig.h
//  ChilEducation
//
//  Created by Developer on 2018/3/29.
//  Copyright © 2018年 DH. All rights reserved.
//

#ifndef BaseDataConfig_h
#define BaseDataConfig_h


#define is_resiter_push @"is_resiter_push"

#define office_money_danwei  @"office_money_danwei"

//这个宏加上后，可以去掉'mas_'这个前缀了
#define MAS_SHORTHAND
//这个宏加上后，可以去掉自动包装方法的'mas_'前缀
#define MAS_SHORTHAND_GLOBALS
//注意，这两个宏必须定义在这个头文件的上面，因为"Masonry.h"中要用到上面2个宏，如果已经定义过了的话
#import <Masonry.h>

#define videoListUrl(Pages)  [NSString stringWithFormat:@"http://c.m.163.com/nc/video/list/V9LG4B3A0/y/%d-10.html",(Pages-1)*10]


#define parent_user_type @"parent_user_type"                 //记录这个房间是不是测试房间

#define fobid_words @"fobid_words"                          //禁止说话的敏感词

//默认域名
#define defaultServe_host   @"defaultServe_host"

//网络状态
#define network_status   @"network_status"

//存储的github上新域名数组字段
#define newHost_fromGithub  @"newHost_fromGithub"

#define TCPMoney_change   @"TCPMoney_change"

#define MoneyEditCommen   @"MoneyEditCommen"

#define MoneyEditOffice   @"MoneyEditOffice"

//全局主题色
#define APPColor [UIColor colorWithHexRGB:0xf6f6fa]

#define FontCommenColor [UIColor colorWithIntegerRed:63 green:63 blue:63]

#define FontSelectColor [UIColor colorWithIntegerRed:102 green:29 blue:172]


#define MW(float) [UIView setMWidth:(float)]
#define MH(float) [UIView setMHeight:(float)]

#define NW(float) MW(float * 1.15 / 3.0)
#define NH(float) MH(float * 1.15 / 3.0)
//屏幕适配
//适配
#define W(float) [UIView setWidth:(float)]
#define H(float) [UIView setHeight:(float)]


#define DefineSize(float) (float * 1.15 / 3.0) * 320.f / 414.f

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define F(float) [UIFont SHSystemFontOfSize:float/(96/72)]

#define kStatusBarHeight 20

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define kNavigationBarHeight (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define kMarginTopHeight (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define kTabBarHeight (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)



#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define IOS11_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )

#define IOS10_OR_EARLIER    ( !IOS11_OR_LATER )
#define IOS9_OR_EARLIER     ( !IOS10_OR_LATER )


//适配

#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


#endif /* BaseDataConfig_h */

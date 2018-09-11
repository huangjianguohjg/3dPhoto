//
//  UIFont+HJGFont.m
//  NestHouse
//
//  Created by DH on 2017/6/6.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "UIFont+HJGFont.h"
#import <objc/message.h>
@implementation UIFont (HJGFont)

+ (CGFloat) calScreenDpi
{
    float scale = 1;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        scale = [[UIScreen mainScreen] scale];  //得到屏幕分辨率
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 132 * scale;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return 163 * scale;
    } else {
        return 160 * scale;
    }
}

+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize
{
    UIFont *HJGFont = [UIFont HJGFont:fontSize];
    return HJGFont;
}
+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize weight:(CGFloat)weight
{
    
    if (iOS8_2Later) {
        
        UIFont * font =  [UIFont SDCFont:fontSize weight:weight];
        
        return font;
    }else{
        if (weight == UIFontWeightBold) {
            return [UIFont boldSystemFontOfSize:fontSize];
        }
        return [UIFont SHSystemFontOfSize:fontSize];
    }

    return [UIFont SDCFont:fontSize weight:weight];
}


+ (CGFloat)getAppFontSize:(CGFloat)fontsize
{
    CGFloat scale = 1.f;
    CGFloat define_size = (fontsize * 1.15 / 3.f ) / scale;

    if ([self calScreenDpi] < 401) {
        scale = 1.65;
        define_size = (fontsize* 1.15 / 2.f ) / scale;
//        DLog(@"%f --2- %f",fontsize, define_size * 2);
    }else{
//        DLog(@"%f --3- %f",fontsize, define_size * 3);
    }
    return define_size;
}

+ (UIFont *)HJGFont:(CGFloat)fontSize{
    
    UIFont *HJGFont = [UIFont systemFontOfSize:[UIFont getAppFontSize:fontSize]];
    return HJGFont;
}

+ (UIFont *)SDCFont:(CGFloat)fontSize weight:(CGFloat)weight
{
    CGFloat s_size = [UIFont getAppFontSize:fontSize];
    
    return [UIFont systemFontOfSize:s_size weight:weight];
}


+ (UIFont *)appTheme56pxMedium
{
    return [UIFont SDCFont:56 weight:UIFontWeightMedium];
}

+ (UIFont *)appTheme58pxRegular
{
    return [UIFont SDCFont:58 weight:UIFontWeightRegular];
}

+ (UIFont *)appTheme36Regular
{
    return [UIFont SDCFont:36 weight:UIFontWeightRegular];
}

+ (UIFont *)appTheme42Regular
{
    return [UIFont SDCFont:42 weight:UIFontWeightRegular];
}

@end

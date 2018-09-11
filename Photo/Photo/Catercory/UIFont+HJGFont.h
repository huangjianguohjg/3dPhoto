//
//  UIFont+HJGFont.h
//  NestHouse
//
//  Created by DH on 2017/6/6.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (HJGFont)

/**
 普通的systemFontOfSize

 @param fontSize 设计图上的尺寸 px,NW(..px)
 @return 对应不同的尺寸得到的Font
 */
+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize;


/**
 普通的 systemFontOfSize:weight:

 @param fontSize fontSize 设计图上的尺寸 px,NW(..px)
 @param weight The weight of the font, specified as a font weight constant. For a list of possible values, see "Font Weights” in UIFontDescriptor. Avoid passing an arbitrary floating-point number for weight, because a font might not include a variant for every weight.
 @return 对应不同的尺寸得到的Font
 */
+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize weight:(CGFloat)weight;


+ (UIFont *)appTheme56pxMedium;


+ (UIFont *)appTheme58pxRegular;


+ (UIFont *)appTheme36Regular;

+ (UIFont *)appTheme42Regular;


@end

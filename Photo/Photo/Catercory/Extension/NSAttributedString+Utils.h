//
//  NSAttributedString+Utils.h
//  Rbyair
//
//  Created by administrator on 15/8/28.
//  Copyright (c) 2015年 wliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSAttributedString (Utils)
/*!
 *  两个字符串拼接并改变其中一个字符串的颜色
 *  @param string   在前面的字符串1
 *  @param string2  在后面的字符串2
 *  @param color    字体颜色，十六进制
 */
-(NSMutableAttributedString *) changeStringColor:(NSString *)string secondString:(NSString *) string2 Color:(NSString *) color;

/**
 *  添加删除线
 *
 *  @param labelStr Label
 *
 *  @return str
 */
+ (NSAttributedString *)addLabelDeleteLine:(NSString *)labelStr;

/**
 *  更改字符串颜色
 *
 *  @param str      <#str description#>
 *  @param strColor <#strColor description#>
 *
 *  @return <#return value description#>
 */
- (NSMutableAttributedString *)changeAttributedStringColor:(NSString *)str withRangeOfStr:(NSString *)strColor;

/**
 *  更改可变字符串颜色
 *
 *  @param str   需要修改颜色的字符串
 *  @param range 字符串颜色修改的范围
 *  @param color 字符串颜色修改
 *
 *  @return 修改后的字符串
 */
+ (NSMutableAttributedString *)changeAttributedColorWithStr:(NSString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range;


+ (void)changeColorWithAttributed:(NSMutableAttributedString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range;
/**
 *  更改行间距
 *
 *  @param labelStr  str
 *  @param lineSpace 行间距
 *
 *  @return 修改后字符串
 */
- (NSAttributedString *)changeLineSpace:(NSString *)labelStr withLineSpace:(CGFloat)lineSpace;

/**
 *  更改字体大小
 *
 *  @param str   需要改变的字符串
 *  @param font  需要改变的字体大小
 *  @param range 需要改变字体的范围
 *
 *  @return 改变后的字符串
 */
+ (NSMutableAttributedString *)changeAttributedFontWithString:(NSString *)str withFont:(UIFont *)font withRange:(NSRange)range;

@end

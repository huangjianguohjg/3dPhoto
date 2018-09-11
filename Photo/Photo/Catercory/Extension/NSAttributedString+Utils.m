//
//  NSAttributedString+Utils.m
//  Rbyair
//
//  Created by administrator on 15/8/28.
//  Copyright (c) 2015年 wliu. All rights reserved.
//

#import "NSAttributedString+Utils.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"
@implementation NSAttributedString (Utils)

-(NSMutableAttributedString *) changeStringColor:(NSString *)string secondString:(NSString *) string2 Color:(NSString *) color{
    NSString *contentStr = [NSString stringWithFormat:@"%@ %@",string,string2];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:string] range:NSMakeRange(0, [string length])];
    
    return  str;
}

#pragma mark- 添加删除线
+ (NSAttributedString *)addLabelDeleteLine:(NSString *)labelStr {
    NSInteger length = [labelStr length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:labelStr];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor colorWithHexString:@"9F9F9F"] range:NSMakeRange(0, length)];
    return attri;
}


+ (NSMutableAttributedString *)changeAttributedColorWithStr:(NSString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range {
    NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc]initWithString:str];
    [mutableString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return mutableString;
}

+ (void)changeColorWithAttributed:(NSMutableAttributedString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range{
    
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
}

#pragma mark- 更改行间距
- (NSAttributedString *)changeLineSpace:(NSString *)labelStr withLineSpace:(CGFloat)lineSpace{
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:labelStr];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:lineSpace];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [labelStr length])];
    return attributedString1;
}

#pragma mark- 更改字体大小
+ (NSMutableAttributedString *)changeAttributedFontWithString:(NSString *)str withFont:(UIFont *)font withRange:(NSRange)range {
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str];
    [attri addAttribute:NSFontAttributeName value:font range:range];
    return attri;

}

@end

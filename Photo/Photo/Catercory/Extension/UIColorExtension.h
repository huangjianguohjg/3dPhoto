//
//  UIColorExtension.h
//  CJ
//
//  Created by weflytotti on 14/10/13.
//  Copyright (c) 2014年 weflytotti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor(Hex)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
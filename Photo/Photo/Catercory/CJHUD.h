//
//  CJHUD.h
//  CJ
//
//  Created by DavidYang on 14/12/4.
//  Copyright (c) 2014年 DavidYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJHUD : UIView


+(void)show:(UIView*)childView;

+(void)showBottom:(UIView*)childView;

+(void)hide;
+ (void)showClearView:(UIView *)childView;

+(void)showController:(UIViewController*)controller;

+(void)showView:(UIView*)childView;

+(void)showView:(UIView*)childView beginYPos:(float)yPos;

@end

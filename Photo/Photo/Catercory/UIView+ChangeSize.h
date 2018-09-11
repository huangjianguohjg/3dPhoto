//
//  UIView+ChangeSize.h
//  ContactExercise
//
//  Created by 123 on 14/12/31.
//  Copyright (c) 2014年 QYQ. All rights reserved.
//

#import <UIKit/UIKit.h>
//当前设备的宽和320的比例
#define WRATIO [UIScreen mainScreen].bounds.size.width/375

//当前设备的高和480的比例

#define kWJScreenHeight [UIScreen mainScreen].bounds.size.height

//#define HRATIO [UIScreen mainScreen].bounds.size.height/667

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define HRATIO (kWJScreenHeight == 812.0 ? 667.0/667.0 : kWJScreenHeight/667.0)

//当前设备的宽和320的比例
#define MaxWRATIO [UIScreen mainScreen].bounds.size.width/414

//当前设备的高和480的比例
#define MaxHRATIO [UIScreen mainScreen].bounds.size.height/736



@interface UIView (ChangeSize)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

+(float)setWidth:(float)width;
+(float)setHeight:(float)height;
+(CGRect)setFrame:(CGRect)frame;

+ (float)setMWidth:(float)width;
+ (float)setMHeight:(float)height;

@end

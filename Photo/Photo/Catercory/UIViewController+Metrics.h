//
//  UIViewController+Metrics.h
//  Alien
//
//  Created by DavidYang on 15/4/7.
//  Copyright (c) 2015年 DavidYang. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  @brief  获取UIViewController frame,bounds,size,width,height
 *  支持设备方向旋转，导航栏，状态栏显示隐藏,值的变化
 */
@interface UIViewController(Metrics)

@property(nonatomic) CGRect     frame;
@property(nonatomic) CGRect     bounds;
@property(nonatomic) CGSize     size;
@property(nonatomic) CGFloat    width;
@property(nonatomic) CGFloat    height;

@property(nonatomic) CGRect     viewFrame;
@property(nonatomic) CGRect     viewBound;
@property(nonatomic) CGSize     viewSize;
@property(nonatomic) CGFloat    viewWidth;
@property(nonatomic) CGFloat    viewHeight;

@end

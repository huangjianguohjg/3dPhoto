//
//  UIBarButtonItem+HJGIteam.h
//  ChilEducation
//
//  Created by Developer on 2017/11/13.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HJGIteam)
+ (instancetype)itemWithNorImage:(NSString *)image frame:(CGRect)frame highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

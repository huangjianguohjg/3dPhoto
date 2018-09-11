//
//  ViewController+Metrics.m
//  Alien
//
//  Created by DavidYang on 15/4/7.
//  Copyright (c) 2015年 DavidYang. All rights reserved.
//

#import "UIViewController+Metrics.h"


@implementation UIViewController(Metrics)

@dynamic frame;
@dynamic bounds;
@dynamic size;
@dynamic width;
@dynamic height;

@dynamic viewFrame;
@dynamic viewBound;
@dynamic viewSize;
@dynamic viewWidth;
@dynamic viewHeight;


-(CGRect)frame
{
    return self.viewFrame;
}

-(CGRect)bounds
{
    return self.viewBound;
}

-(CGSize)size
{
    return self.viewSize;
}

-(CGFloat)width
{
    return self.viewWidth;
}

-(CGFloat)height
{
    return self.viewHeight;
}

-(CGRect)viewFrame
{
    CGRect bounds =[UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation] )) {
        bounds.origin = CGPointMake(bounds.origin.y, bounds.origin.x);
        bounds.size = CGSizeMake(bounds.size.height, bounds.size.width);
        
        if (IOS6_OR_EARLIER) {
            
            if ([UIApplication sharedApplication].statusBarHidden == NO) {
                bounds.origin.x +=20;
                bounds.size.width-=20;
            }
        }
    }
    else{
        
        if (IOS6_OR_EARLIER) {
            if ([UIApplication sharedApplication].statusBarHidden == NO) {
                bounds.origin.y +=20;
                bounds.size.height-= 20;
            }
            
            if (self.navigationController.navigationBarHidden ==NO) {
                bounds.size.height -= self.navigationController.navigationBar.bounds.size.height;
            }
        }
    }
    return bounds;
}

-(CGRect)viewBound
{
    CGRect bound = self.viewFrame;
    bound.origin = CGPointZero;
    return bound;
}

-(CGSize)viewSize
{
    return self.viewFrame.size;
}

-(CGFloat)viewWidth
{
    return self.viewFrame.size.width;
}

-(CGFloat)viewHeight
{
    return self.viewFrame.size.height;
}

@end

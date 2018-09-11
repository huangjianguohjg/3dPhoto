//
//  UIView+LayoutMethods.m
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import "UIView+LayoutMethods.h"

@implementation UIView (LayoutMethods)

// coordinator getters
- (CGFloat)l_height
{
    return self.frame.size.height;
}

- (CGFloat)l_width
{
    return self.frame.size.width;
}

- (CGFloat)l_x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)l_y
{
    return self.frame.origin.y;
}

- (CGSize)l_size
{
    return self.frame.size;
}

- (CGPoint)l_origin
{
    return self.frame.origin;
}

- (CGFloat)l_centerX
{
    return self.center.x;
}

- (CGFloat)l_centerY
{
    return self.center.y;
}

- (CGFloat)l_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)l_right
{
    return self.frame.size.width + self.frame.origin.x;
}

// height
- (void)setHeight:(CGFloat)height
{
    CGRect newFrame = CGRectMake(self.l_x, self.l_y, self.l_width, height);
    self.frame = newFrame;
}

- (void)heightEqualToView:(UIView *)view
{
    self.height = view.l_height;
}

// width
- (void)setWidth:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.x, self.y, width, self.l_height);
    self.frame = newFrame;
}

- (void)widthEqualToView:(UIView *)view
{
    self.width = view.l_width;
}

// center
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = CGPointMake(self.l_centerX, self.l_centerY);
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = CGPointMake(self.l_centerX, self.l_centerY);
    center.y = centerY;
    self.center = center;
}

- (void)centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.centerX = centerPoint.x;
}

- (void)centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.centerY = centerPoint.y;
}

// top, bottom, left, right
- (void)top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y + top + view.l_height;
}

- (void)bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y - bottom - self.l_height;
}

- (void)left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x - left - self.l_width;
}

- (void)right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + right + view.l_width;
}

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        [self setHeight:self.y - top + self.l_height];
    }
    self.y = top;
}

- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        [self setHeight: self.superview.l_height - bottom - self.y];
    } else {
        [self setY:self.superview.l_height - self.l_height - bottom];
    }
}

- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        [self setWidth: self.x - left + self.superview.l_width];
    }
    self.x = left;
}

- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        [self setWidth: self.superview.l_width - right - self.x];
    } else {
        [self setX: self.superview.l_width - self.l_width - right ];
    }
}

- (void)topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y;
}

- (void)bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.y = newOrigin.y + view.l_height - self.l_height;
}

- (void)leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x;
}

- (void)rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.l_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.x = newOrigin.x + view.l_width - self.l_width;
}

// size
- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (void)sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.x, self.y, view.l_width, view.l_height);
}

// imbueset
- (void)fillWidth
{
    self.width = self.superview.l_width;
}

- (void)fillHeight
{
    self.height = self.superview.l_height;
}

- (void)fill
{
    self.frame = CGRectMake(0, 0, self.superview.l_width, self.superview.l_height);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

@end

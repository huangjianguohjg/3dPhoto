//
//  UIView+AddAction.h
//  NestHouse
//
//  Created by shansander on 2017/4/7.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(UIGestureRecognizer * gesture);

@interface UIView(AddAction)

- (void)addSimpleTapAction:(ActionBlock)action;
@end

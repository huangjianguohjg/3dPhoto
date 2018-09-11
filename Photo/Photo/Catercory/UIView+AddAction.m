//
//  UIView+AddAction.m
//  NestHouse
//
//  Created by shansander on 2017/4/7.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "UIView+AddAction.h"
@implementation UIView(AddAction)

- (void)addSimpleTapAction:(ActionBlock)action
{
    UITapGestureRecognizer * tapgesture = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tapgesture];
}
@end

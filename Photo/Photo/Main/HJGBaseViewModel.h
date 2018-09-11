//
//  HJGBaseViewModel.h
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HJGBaseViewModel : NSObject


@property (nonatomic, weak, readonly) UIViewController * viewController;


+(HJGBaseViewModel *)modelWithViewController:(UIViewController *)viewController;
- (instancetype)initWithViewController:(UIViewController *)viewController;
- (void)initialize;


@end

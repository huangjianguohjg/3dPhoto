
//
//  HJGBaseViewModel.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGBaseViewModel.h"

@implementation HJGBaseViewModel

+(HJGBaseViewModel *)modelWithViewController:(UIViewController *)viewController;
{
    HJGBaseViewModel * viewModel = [[self alloc] initWithViewController:viewController];
    return viewModel;
}

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        _viewController = viewController;
        
        [self initialize];
    }
    return self;
}
//TODO: 初始化
- (void)initialize
{
    
}




@end

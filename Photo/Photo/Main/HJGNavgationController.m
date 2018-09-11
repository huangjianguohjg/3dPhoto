//
//  HJGNavgationController.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGNavgationController.h"

@interface HJGNavgationController ()<UINavigationControllerDelegate>

@end

@implementation HJGNavgationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor orangeColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIImage *bgImage = [[UIImage imageNamed:@"header bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    [bar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 为self创建弱引用对象
//    __weak typeof (self) weakSelf = self;
    @weakify_self;
    if ([self respondsToSelector:@selector(back)]) {
        @strongify_self;
        self.interactivePopGestureRecognizer.delegate = self;
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"leftpoint"] forState:UIControlStateNormal];
        button.size = CGSizeMake(W(80), H(22));
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, W(61));
        if (IOS9_OR_LATER) {
            [[button.widthAnchor constraintEqualToConstant:W(80)] setActive:YES];
            [[button.heightAnchor constraintEqualToConstant:H(22)] setActive:YES];
            
        }
        
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

        //隐藏底部tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
//    [super pushViewController:viewController animated:animated];
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;

    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}




@end

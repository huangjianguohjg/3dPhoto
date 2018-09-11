//
//  HJGTabBarController.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGTabBarController.h"
#import "HJGNavgationController.h"
//#import "HJGShenHeNewsController.h"
//#import "HJGPgTwoController.h"
//#import "HJGPgThreeController.h"
//#import "HJGPgFourController.h"


@interface HJGTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,assign) NSInteger lastSelectedIndex;

@end

@implementation HJGTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setShenheApp];
    
}



+ (void)initialize{
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
}


- (void)setShenheApp{
    
//    HJGShenHeNewsController *neVC = [[HJGShenHeNewsController alloc]init];
//    [self setOneChildController:neVC title:@"圈子" nomarlImage:@"shenhe_home" selectedImage:@"shenhe_home_a"];
//    
//    HJGPgTwoController *shenHeVC = [[HJGPgTwoController alloc]init];
//    [self setOneChildController:shenHeVC title:@"发布" nomarlImage:@"shenhe_public" selectedImage:@"shenhe_public_a"];
//    
//    
//    HJGPgThreeController *newsVC = [[HJGPgThreeController alloc]init];
//    [self setOneChildController:newsVC title:@"新闻" nomarlImage:@"shenhe_me" selectedImage:@"shenhe_me_a"];
//    
//    HJGPgFourController *reVC = [[HJGPgFourController alloc]init];
//    [self setOneChildController:reVC title:@"火爆热推" nomarlImage:@"shenhe_me" selectedImage:@"shenhe_me_a"];
    
}



- (void)setOneChildController:(UIViewController *)vc title:(NSString *)title nomarlImage:(NSString *)nomarlImage selectedImage:(NSString *)selectedImage{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:nomarlImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[HJGNavgationController alloc]initWithRootViewController:vc]];
    
}

#pragma mark -- UITarBarDelegate
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}



@end

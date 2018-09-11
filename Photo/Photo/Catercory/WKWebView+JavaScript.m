//
//  WKWebView+JavaScript.m
//  NestHouse
//
//  Created by shansander on 2017/5/10.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "WKWebView+JavaScript.h"

@implementation WKWebView (JavaScript)
///  获取某个标签的结点个数
- (void)nodeCountOfTag:(NSString *)tag completionHandler:(void(^)(int count))completion {
    
    //    NSString *lJs = @"document.documentElement.innerHTML";
    
    //    NSString * htmlContent = [self stringByEvaluatingJavaScriptFromString:lJs];
    
    
    NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('%@').length", tag];
    
    //    NSString * html_img_count = [self stringByEvaluatingJavaScriptFromString:jsString];
    
    [self evaluateJavaScript:jsString completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        if (completion) {
            completion([data intValue]);
        }
        
    }];
    
}

///  获取所有图片链接
- (void )getImgsCompletionHandler:(void(^)(NSArray * list))completion {
//    NSMutableArray *arrImgURL = [[NSMutableArray alloc] init];
//    int node = [self nodeCountOfTag:@"img"];
//    for (int i = 0; i < node; i++) {
//        NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('img')[%d].src", i];
//        NSString *img = [self stringByEvaluatingJavaScriptFromString:jsString];
//        [arrImgURL addObject:img];
//    }
//    return arrImgURL;
    NSString * run_json_content = @"function getImages() {let count = document.getElementsByTagName('img').length; var list = new Array();        for (var i = count - 1; i >= 0; i--) { let url = document.getElementsByTagName('img')[i].src;            list[i] = url;}        return list;    }\n getImages()";
    
    [self evaluateJavaScript:run_json_content completionHandler:^(id _Nullable data, NSError * _Nullable error) {
  //      NSLog(@"%@",data);
        if (completion) {
            completion(data);
        }
    }];
}
@end

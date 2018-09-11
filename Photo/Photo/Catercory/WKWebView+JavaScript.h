//
//  WKWebView+JavaScript.h
//  NestHouse
//
//  Created by shansander on 2017/5/10.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <WebKit/WebKit.h>

@interface WKWebView (JavaScript)


- (void )getImgsCompletionHandler:(void(^)(NSArray * list))completion;
@end

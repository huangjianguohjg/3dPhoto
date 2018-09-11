//
//  WPSyncActionSheet.h
//  wespy
//
//  Created by Liu Gang on 13-12-19.
//  Copyright (c) 2013年 wepie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPSyncActionSheet : UIActionSheet
- (id)initWithTitle:(NSString *)title completion:(void(^)(UIActionSheet *theSheet, NSInteger buttonIndex))completion cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
@end

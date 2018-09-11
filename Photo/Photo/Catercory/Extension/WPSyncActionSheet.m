//
//  WPSyncActionSheet.m
//  wespy
//
//  Created by Liu Gang on 13-12-19.
//  Copyright (c) 2013年 wepie. All rights reserved.
//

#import "WPSyncActionSheet.h"

@interface WPSyncActionSheet () <UIActionSheetDelegate>
@property(nonatomic, copy) void (^completionBlock)(UIActionSheet *theSheet, NSInteger buttonIndex);
@end

@implementation WPSyncActionSheet

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
            completion:(void (^)(UIActionSheet *theSheet, NSInteger buttonIndex))completion
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSString *)otherButtonTitles, ... {
    /*
     iOS 7 iPad 上面有BUG
     */
    self = [super init];
    va_list argumentList;
    NSString *buttonTitle;
    if (otherButtonTitles) {
        [self addButtonWithTitle:otherButtonTitles];
        va_start(argumentList, otherButtonTitles);
        while ((buttonTitle = va_arg(argumentList, NSString *))) {
            [self addButtonWithTitle:buttonTitle];
        }
        va_end(argumentList);
    }
    if (destructiveButtonTitle) {
        self.destructiveButtonIndex = [self addButtonWithTitle:destructiveButtonTitle];
    }
    if (cancelButtonTitle) {
        self.cancelButtonIndex = [self addButtonWithTitle:cancelButtonTitle];
    }
    self.title = title;
    self.delegate = self;
    self.completionBlock = completion;
    return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.completionBlock(actionSheet, buttonIndex);
        });
    }
}

- (NSInteger)firstOtherButtonIndex {
    return 0;
}
@end

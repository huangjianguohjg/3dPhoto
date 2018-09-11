//
//  HJGDoneSubjectAction.h
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HJGDoneSubjectType) {
    HJGDoneSubject_Home_Define, // 家 默认，没有事件
};

@interface HJGDoneSubjectAction : NSObject

@property (nonatomic, assign) HJGDoneSubjectType subject_type;

@property (nonatomic, strong) NSObject * info;

- (instancetype)initWithType:(HJGDoneSubjectType)type object:(NSObject *)object;

@end

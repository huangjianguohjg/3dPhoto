
//
//  HJGDoneSubjectAction.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGDoneSubjectAction.h"

@implementation HJGDoneSubjectAction

- (instancetype)initWithType:(HJGDoneSubjectType)type object:(NSObject *)object
{
    self = [super init];
    if (self) {
        _subject_type = type;
        _info = object;
    }
    return self;
}


@end

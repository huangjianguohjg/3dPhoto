//
//  HJGBaseDataModel.h
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HJGDoneSubjectAction.h"

typedef NS_ENUM(NSInteger) {
    DataModelProductService = 1,
    DataModelDecorationCase,
    DataModelDesignGallery,
    DataModelDecorationRaiders,
}HomeServiceDataModel;
@class RACSignal;

@interface HJGBaseDataModel : NSObject

@property (nonatomic, assign) CGFloat hegiht_size_cell;


@property (nonatomic, assign) UIEdgeInsets cellEdgeInset;

@property (nonatomic, assign) HomeServiceDataModel serviceModel;

@property (nonatomic, assign) BOOL showBottomLine;



/**
 这个是为了有些类是重复使用的，但是点击的效果是不一样的，
 */
@property (nonatomic, assign) HJGDoneSubjectType done_subject_type;


- (void)loadheaderModel:(HomeServiceDataModel)type;

- (NSString *)CellIdentifier;

@end

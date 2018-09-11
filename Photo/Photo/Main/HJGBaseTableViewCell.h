//
//  HJGBaseTableViewCell.h
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJGBaseDataModel.h"
@interface HJGBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) HJGBaseDataModel * dataModel;

@property (nonatomic, assign) NSIndexPath* indexPath;

@property (nonatomic, assign) CGFloat height_statistics_cell;

@property (nonatomic, assign) CGFloat superViewFrameWidth;



/**
 获取Cell Identifier
 
 @return 返回UItableViewCell的类名
 */
+ (NSString *)getCellIdentifier;


/**
 获取cell的model
 */
- (void)loadHomeDataModel:(HJGBaseDataModel * )model;

@property (nonatomic, weak) UITapGestureRecognizer * simpleTapGesure;

- (void)onsimpleTapAction:(UIGestureRecognizer *)gesture;

@property (nonatomic, weak) UIView *simpleLineView;

- (void)refeshFrame;

@end


//
//  HJGBaseDataModel.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGBaseDataModel.h"
#import "HJGBaseTableViewCell.h"
@interface HJGBaseDataModel()


@end
@implementation HJGBaseDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 默认的高度
        self.hegiht_size_cell = 100;
        // 默认数据
        [self configData];
    }
    return self;
}

- (void)configData
{

}

- (void)loadheaderModel:(HomeServiceDataModel)type
{
    if (type > DataModelDecorationRaiders) {
        return;
    }
    self.serviceModel = type;
}

- (NSString *)CellIdentifier
{
    return [HJGBaseTableViewCell getCellIdentifier];
}





@end

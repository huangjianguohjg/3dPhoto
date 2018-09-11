//
//  UITableView+RegisterCell.m
//  NestHouse
//
//  Created by shansander on 2017/3/29.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "UITableView+RegisterCell.h"
#import "HJGBaseTableViewCell.h"

@implementation UITableView (RegisterCell)

- (void)registerClass:(Class)aclass{
    NSString *Identifier = [aclass getCellIdentifier];

    [self registerClass:aclass forCellReuseIdentifier:Identifier];
}



@end

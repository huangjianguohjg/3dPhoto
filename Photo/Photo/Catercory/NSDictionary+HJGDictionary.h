//
//  NSDictionary+HJGDictionary.h
//  ChilEducation
//
//  Created by DH on 2017/9/17.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HJGDictionary)

//在.h文件中声明要使用的方法名
/*****************获取升序键值*********************/
- (NSArray *)nk_ascendingComparedAllKeys;

/*****************获取降序键值*********************/
- (NSArray *)nk_descendingComparedAllKeys;

@end

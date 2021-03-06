//
//  AppModel.h
//  九宫格
//
//  Created by MichaelLi on 2016/9/30.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;


//对象方法
-(instancetype)initWithDict:(NSDictionary *)dict;
//类方法
-(instancetype)appModelWithDict:(NSDictionary *)dict;
@end

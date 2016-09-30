//
//  AppModel.m
//  九宫格
//
//  Created by MichaelLi on 2016/9/30.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self  = [super init]) {

        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

-(instancetype)appModelWithDict:(NSDictionary *)dict
{
    return [self initWithDict:dict];
}
@end

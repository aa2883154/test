//
//  HomeNewsCache.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeNewsCache.h"

@implementation HomeNewsCache
+ (instancetype)sharedInstance
{
    static id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [NSMutableArray array];
    });
    return _instance;
}

@end

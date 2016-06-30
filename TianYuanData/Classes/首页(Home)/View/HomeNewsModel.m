//
//  HomeNewsModel.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeNewsModel.h"
#import "TYNetworkTool.h"

@implementation HomeNewsModel
+(instancetype)newsWithDict:(NSDictionary *)dic
{
    HomeNewsModel *model = [[HomeNewsModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void)newsDataListWithUrlString:(NSString *)urlString complection:(void (^)(NSMutableArray *))complection
{
    //异步请求
    [[TYNetworkTool sharedTools]GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self newsWithDict:dict]];
        }
        complection(arrayM);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}

@end

//
//  HomeListModel.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeListModel.h"
#import "TYNetworkTool.h"

@implementation HomeListModel

+(instancetype)initWithDict:(NSDictionary *)dic
{
    HomeListModel *model = [[HomeListModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(void)setTid:(NSString *)tid
{
    _tid = tid.copy;
    _urlString = [NSString stringWithFormat:@"article/headline/%@/0-20.html",tid];
}

+(NSArray *)channels
{
    //1.获取JSON数据
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    NSData *data  = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dic[@"tList"];
    //2.字典转模型
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
    for (NSDictionary *tmpDic in array) {
        HomeListModel *list = [HomeListModel initWithDict:tmpDic];
        [mArray addObject:list];
    }
    return [mArray sortedArrayUsingComparator:^NSComparisonResult(HomeListModel * _Nonnull obj1, HomeListModel * _Nonnull obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
}


-(NSString *)description
{
    NSDictionary *dict = [self dictionaryWithValuesForKeys:@[@"tname",@"tid"]];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

@end

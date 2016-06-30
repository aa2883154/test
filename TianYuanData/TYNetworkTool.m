//
//  TYNetworkTool.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TYNetworkTool.h"

@implementation TYNetworkTool
+(instancetype)sharedTools
{
    static TYNetworkTool *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        //设置请求超时
        config.timeoutIntervalForRequest = 10;
        tools = [[self alloc]initWithBaseURL:baseURL sessionConfiguration:config];
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return tools;
}

@end

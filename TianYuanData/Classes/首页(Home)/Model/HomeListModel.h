//
//  HomeListModel.h
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeNewsModel;
@interface HomeListModel : NSObject

@property (nonatomic,copy) NSString *tname;
@property (nonatomic,copy) NSString *tid;
@property(nonatomic,copy,readonly)NSString *urlString;

+(instancetype)initWithDict:(NSDictionary *)dic;

+(NSArray *)channels;
@end

//
//  HomeNewsCell.h
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeNewsModel;
@interface HomeNewsCell : UITableViewCell

@property(nonatomic)HomeNewsModel *newsModel;

/** 轮播点击事件 */
@property (nonatomic, copy) void(^cycleImageClickBlock)(NSInteger idx);

//新闻标题
@property (weak, nonatomic) IBOutlet UILabel *title;

+ (NSString *)cellReuseID:(HomeNewsModel *)newsModel;

+ (CGFloat)cellForHeight:(HomeNewsModel *)newsModel;

@end

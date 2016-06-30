//
//  HomeListCell.h
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeNewsTVC;

@interface HomeListCell : UICollectionViewCell
@property (nonatomic, strong) HomeNewsTVC *homeNewsTVC;
@property (nonatomic, copy  ) NSString  *urlString;
@end

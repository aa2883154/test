//
//  CommentAllCell.h
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CommentAllCellDelegate <NSObject>

-(void)pushToHomePage;

@end
@interface CommentAllCell : UITableViewCell

@property(nonatomic,weak)id<CommentAllCellDelegate>delegate;

@end

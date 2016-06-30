//
//  PersonalNameController.h
//  TianYuanData
//
//  Created by 天元数科 on 16/6/6.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeDelegate <NSObject>

-(void)saveChangeData:(NSString *)text;

@end
@interface PersonalNameController : UIViewController

@property(nonatomic,strong)NSString *name;

@property(nonatomic,weak)id<ChangeDelegate>delegate;

@end

//
//  PersonalMakeViewController.h
//  TianYuanData
//
//  Created by 天元数科 on 16/5/25.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalNameController.h"

@class PersonalMakeViewController;

@protocol PersonalMakeViewControllerDelegate <NSObject>
-(void)presentViewController:(UIViewController *)viewController andPersonalMakeViewController:(PersonalMakeViewController *)PersonalMakeViewController;
@end

@interface PersonalMakeViewController : UIViewController

@property(nonatomic)id <PersonalMakeViewControllerDelegate>delegate;

@property(nonatomic)NSString *name;

@end

//
//  TYTabBarController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/27.
//  Copyright © 2016年 天元数科. All rights reserved.


#import "TYTabBarController.h"
#import "HomeViewController.h"
#import "TrackViewController.h"
#import "CommentViewController.h"
#import "MessageViewController.h"
#import "PersonalViewController.h"

#import "TYNavigationController.h"

@interface TYTabBarController ()

@end

@implementation TYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildViewController:home image:@"home" selectedImage:@"home-checked" title:@"首页"];
    
    TrackViewController *track = [[TrackViewController alloc]init];
    [self addChildViewController:track image:@"trace" selectedImage:@"trace-checked" title:@"追踪"];
    
    CommentViewController *comment = [[CommentViewController alloc]init];
    [self addChildViewController:comment image:@"message-1" selectedImage:@"message-checked" title:@"消息"];
    
    MessageViewController *message = [[MessageViewController alloc]init];
    [self addChildViewController:message image:@"discuss" selectedImage:@"discuss-checked" title:@"评论"];
    
    PersonalViewController *personal = [[PersonalViewController alloc]init];
    [self addChildViewController:personal image:@"mine" selectedImage:@"mine-checked" title:@"我的"];
    self.tabBar.backgroundColor = [UIColor whiteColor];
}

-(void)addChildViewController:(UIViewController *)childController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    //标题
    childController.title = title;
    childController.view.backgroundColor = [UIColor whiteColor];
    
    //tabBarItem图片
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem字体的设置
    //正常状态
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
//    normalText[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0];
    normalText[NSForegroundColorAttributeName] = Black_Color;
   
    [childController.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    //选中状态
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    selectedText[NSForegroundColorAttributeName] = [UIColor colorWithRed:249/255.0 green:192/255.0 blue:49/255.0 alpha:1.0];

    [childController.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
    
    TYNavigationController *nav = [[TYNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

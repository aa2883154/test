//
//  TYNavigationController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/27.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TYNavigationController.h"

@interface TYNavigationController ()

@end

@implementation TYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//设置状态栏高亮显示
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
+(void)initialize
{
    UINavigationBar *navbar = [UINavigationBar appearance];
    navbar.barTintColor = [UIColor whiteColor];
    
//    [navbar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [navbar setTitleTextAttributes:@{NSForegroundColorAttributeName:Yellow_Color,NSFontAttributeName:[UIFont systemFontOfSize:20]}];
  
    //设置当前的导航按钮－－－获取正在显示的导航按钮
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    item.tintColor = [UIColor redColor];
//    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        self.interactivePopGestureRecognizer.delegate = (id)self;
//        UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"arrow-left"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
        
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(0, 0, 15, 20);
            [btn setImage:[UIImage imageNamed:@"arrow-left"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:btn];
            self.navigationItem.leftBarButtonItem = back;
        
        UIBarButtonItem *fixed = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace  target:nil action:nil];
        fixed.width = -10;
        viewController.navigationItem.leftBarButtonItems = @[back,fixed];
    }
    [super pushViewController:viewController animated:YES];
}
-(void)backClick
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

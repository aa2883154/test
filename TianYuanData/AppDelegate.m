//
//  AppDelegate.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/20.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "AppDelegate.h"
#import "TYTabBarController.h"
#import "NewCollectionView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    
    
    
    //网络指示器
//     application.networkActivityIndicatorVisible = YES;
    //1.获取当前的版本号
    CGFloat version = [[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"] floatValue];
      //2.获取上一个版本号 从用户偏好中获取上一次的版本号
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat oldVersion = [userDefaults floatForKey:@"version"];
    //3.判断当前版本是否大于上一次的版本
    if (version > oldVersion) {
        //打开新特性界面
        NewCollectionView *collectionView = [[NewCollectionView alloc]init];
        self.window.rootViewController = collectionView;
            //当前版本大于上一次版本,打开新特性界面,记录版本号
        [userDefaults setFloat:version forKey:@"version"];
        
    }else
    {
        TYTabBarController *tab = [[TYTabBarController alloc]init];
        self.window.rootViewController =tab;
    }
       return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

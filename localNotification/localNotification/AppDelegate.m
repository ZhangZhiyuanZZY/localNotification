//
//  AppDelegate.m
//  localNotification
//
//  Created by 章芝源 on 15/11/6.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

///UIApplication的代理就是AppDelegate



///程序是活的情况
/**
*  接收到本地通知的时候就会调用
*  程序在前台: 会调用     程序在后台:点击横幅 就算接收通知 也会调用  -> 程序活着就会调用
*  @param application  应用
*  @param notification 通知
*/
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    ///看看推送成功后, 显示的东西
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 500, 100)];
    
    label.backgroundColor = [UIColor redColor];
    
    label.text = [NSString stringWithFormat:@"%@", notification];
    [self.window.rootViewController.view addSubview:label];
    
}

///程序被关闭的情况  从死到生  当程序被关闭, 我们点击推送选项后    不会去调用viewdidLoad进行运行, 但是不管怎么样都会
///进行程序启动的炒作,  会到这个程序已经完成启动的方法里来
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   ///launchOptions  这个参数中包含着程序启动中的一些信息参数
    ///拿到本地通知
    UILocalNotification *local = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (local) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 500, 100)];
        label.backgroundColor = [UIColor blueColor];
        
        label.text = [NSString stringWithFormat:@"%@", local.userInfo];
        label.numberOfLines = 0;
        [self.window.rootViewController.view addSubview:label];
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

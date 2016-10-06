//
//  AppDelegate.m
//  Nerdfeed
//
//  Created by 洪龙通 on 2016/10/5.
//  Copyright © 2016年 洪龙通. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"

@interface AppDelegate () 

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BNRCoursesViewController *coursesVC = [[BNRCoursesViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:coursesVC];
    // 在应用启动时就初始化webViewController
    BNRWebViewController *webVC = [[BNRWebViewController alloc] init];
    coursesVC.webViewController = webVC;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        UINavigationController *detailNavi = [[UINavigationController alloc] initWithRootViewController:webVC];
        UISplitViewController *spliteVC = [[UISplitViewController alloc] init];
        spliteVC.delegate = webVC;
        spliteVC.viewControllers = @[navi, detailNavi];
        spliteVC.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
        
        self.window.rootViewController = spliteVC;
    }else {
        self.window.rootViewController = navi;
    }
    
    [self.window makeKeyAndVisible];
    
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
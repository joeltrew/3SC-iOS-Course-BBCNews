//
//  AppDelegate.m
//  BBCNews
//
//  Created by Joel Trew on 24/02/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "AppDelegate.h"
#import "JLTTopNewsTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
     self.window.backgroundColor = [UIColor whiteColor];

    JLTTopNewsTableViewController *topNewsView = [[JLTTopNewsTableViewController alloc]init];
    
    UINavigationController *topNewsNavController = [[UINavigationController alloc]initWithRootViewController:topNewsView];
    
    self.window.rootViewController = topNewsNavController;
   
    
    [self.window makeKeyAndVisible];
    
    [self customiseAppearance];
    
    
    return YES;
}

- (void)customiseAppearance
{
        UIWindow *window = self.window;
        window.tintColor = [UIColor colorWithRed:0.745 green:0.000 blue:0.020 alpha:1.000];
        window.backgroundColor = [UIColor whiteColor];
    
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        navigationBar.barTintColor = [UIColor colorWithRed:0.745 green:0.000 blue:0.020 alpha:1.000];
        navigationBar.tintColor = [UIColor whiteColor];
        [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
        [navigationBar setTranslucent:NO];
    
    UITabBar *tabBar = [UITabBar appearance];
        tabBar.tintColor = [UIColor colorWithRed:0.745 green:0.000 blue:0.020 alpha:1.000];
    
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

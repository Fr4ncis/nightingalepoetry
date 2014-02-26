//
//  AppDelegate.m
//  Nightingale
//
//  Created by Francesco Mattia on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "AppDelegate.h"
#import "MapLocationsViewController.h"
#import "NotificationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:15.0f];
    notification.alertBody = @"You discovered a new poem!";
    [application scheduleLocalNotification:notification];
    
    // Override point for customization after application launch.
    UIWindow *window = [[UIApplication sharedApplication] windows][0];
    window.rootViewController = [MapLocationsViewController new];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIWindow *window = [[UIApplication sharedApplication] windows][0];
    [window.rootViewController presentViewController:[NotificationViewController new] animated:YES completion:nil];
}

@end

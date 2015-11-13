//
//  AppDelegate.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 02/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "AppDelegate.h"

#import "NGWRootViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NGWRootViewController *rootVC = [NGWRootViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end

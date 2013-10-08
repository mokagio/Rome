//
//  RMAppDelegate.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "RMAppDelegate.h"
#import "RMHomeViewController.h"
#import "RMBlueViewController.h"
#import "RMRedViewController.h"
#import "RMRouter.h"

@implementation RMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [ROUTER registerRouteWithPath:@"blue" viewControllerClass:[RMBlueViewController class]];
    [ROUTER registerRouteWithPath:@"red" viewControllerClass:[RMRedViewController class]];
    
    RMHomeViewController *viewController = [[RMHomeViewController alloc] init];
    ROUTER.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = ROUTER.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

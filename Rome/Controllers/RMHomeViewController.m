//
//  RMViewController.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "RMHomeViewController.h"
#import <UIAlertView+Blocks.h>

@interface RMHomeViewController ()
- (IBAction)redButtonTouched:(id)sender;
- (IBAction)blueButtonTouched:(id)sender;
- (void)scheduleLocalNotificationWithColor:(NSString *)color;
@end

@implementation RMHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)redButtonTouched:(id)sender {
    [UIAlertView showWithTitle:@"YOU CHOSE RED"
                       message:@"now close the app and in about 15 seconds you'll receive a notification"
             cancelButtonTitle:@"OK"
             otherButtonTitles:@[]
                      tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                          [self scheduleLocalNotificationWithColor:@"red"];
                      }];
}

- (IBAction)blueButtonTouched:(id)sender {
    [UIAlertView showWithTitle:@"YOU CHOSE BLUE"
                       message:@"now close the app and in about 15 seconds you'll receive a notification"
             cancelButtonTitle:@"OK"
             otherButtonTitles:@[]
                      tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                          [self scheduleLocalNotificationWithColor:@"blue"];
                      }];
}

- (void)scheduleLocalNotificationWithColor:(NSString *)color
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification == nil) {
        // notify the user!
        return;
    } else {
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:15];
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.alertBody = @"Time to see where the pill brought you";
        notification.applicationIconBadgeNumber = 1;
        notification.userInfo = @{@"path":color};
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

@end

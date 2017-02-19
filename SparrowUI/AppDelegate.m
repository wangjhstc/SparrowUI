//
//  AppDelegate.m
//  SparrowUI
//
//  Created by microsparrow on 16/9/29.
//  Copyright © 2016年 microsparrow. All rights reserved.
//

#import "AppDelegate.h"
/* 测试类 */
#import "Dispatch.h"

//#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    {
        //UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //UINavigationController *navigationVC = [story instantiateViewControllerWithIdentifier:@"CommodityNavigationController"];
        //[self presentViewController:navigationVC animated:NO completion:nil];
    }
    
    UIViewController *viewController = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)test {
    [Dispatch gobal:^{
        NSArray<NSString *> *array = [UIFont familyNames];
        NSLog(@"%@",array);
    }];

    [Dispatch asycn:^{
        NSLog(@"abc");
    }];
}

@end

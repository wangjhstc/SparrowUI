//
//  ViewController.m
//  SparrowUI
//
//  Created by microsparrow on 16/9/29.
//  Copyright © 2016年 microsparrow. All rights reserved.
//

#import "ViewController.h"
//#import "BInterface.h"
#import "MInterface.h"

@import SparrowBusiness;

//MARK:IBOutlet
@interface ViewController ()

@property   (nonatomic,weak)    IBOutlet    UITextField     *txtUserName;
@property   (nonatomic,weak)    IBOutlet    UITextField     *txtPassword;

@property   (nonatomic,weak)    IBOutlet    UILabel     *labName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - visual layout


#pragma mark - Data Binding

- (IBAction)touchLogin:(id)sender {
    NSString *userName = [_txtUserName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = _txtPassword.text;

    userName = @"wangjhstc";
    password = @"mima";
    
    if (userName.length <= 0 || password <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"用户名或密码不能为空！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    [[BInterface LoginInterface] loginWithUserName:userName
                                          password:password
                                      successBlock:^(id data) {
                                          UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                          UINavigationController *navigationVC = [story instantiateViewControllerWithIdentifier:@"CommodityNavigationController"];
                                          
                                          [self presentViewController:navigationVC animated:NO completion:nil];
                                      }
                                         failBlock:^(NSError *error) {
                                             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"登录错误！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                             [alertView show];
                                         }];
}

@end

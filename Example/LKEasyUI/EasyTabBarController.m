//
//  EasyTabBarController.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import "EasyTabBarController.h"
#import "LeeLoginViewController.h"
#import "EASYViewController.h"
@interface EasyTabBarController ()

@end

@implementation EasyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    LeeLoginViewController *Vc = [[LeeLoginViewController alloc]init];
    Vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:Vc animated:YES completion:nil];
      
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

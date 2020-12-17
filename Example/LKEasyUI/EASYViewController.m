//
//  EASYViewController.m
//  LKEasyUI
//
//  Created by lice_home@163.com on 12/07/2020.
//  Copyright (c) 2020 lice_home@163.com. All rights reserved.
//

#import "EASYViewController.h"
#import "LoginView.h"
#import <Masonry.h>
@interface EASYViewController ()

@end

@implementation EASYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeUI];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)makeUI{
    LoginView *loginV = [[LoginView alloc]init];
    [self.view addSubview:loginV];
    __weak typeof(self) weakSelf = self;
    [loginV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
        make.width.equalTo(@(KScreenWidth - 60));
        make.height.equalTo(@(loginV.loginView_H));
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

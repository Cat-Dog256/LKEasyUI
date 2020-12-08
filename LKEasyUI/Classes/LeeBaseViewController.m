//
//  LeeBaseViewController.m
//  NIM
//
//  Created by mac on 2020/7/17.
//  Copyright © 2020 Luculent. All rights reserved.
//

#import "LeeBaseViewController.h"

@interface LeeBaseViewController ()

@end

@implementation LeeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeUI];
    [self bindView];
    [self requestData];
    // Do any additional setup after loading the view.
}
- (void)makeUI{
    
}
- (void)bindView{
}
- (void)requestData{
    
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

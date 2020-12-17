//
//  LoginView.h
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/14.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LCBaseUI.h>
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : LCView
@property (nonatomic, assign, getter=loginView_H) CGFloat view_H;
@property (nonatomic, strong) RACSignal<NSDictionary *> *loginSignal;
@property (nonatomic, strong) LCTextField *phoneTf;
@property (nonatomic, strong) LCLabel *phoneLab;

@property (nonatomic, strong) LCTextField *passwordTf;
@property (nonatomic, strong) LCLabel *paswordLab;

@property (nonatomic, strong) LCButton *loginBtn;

@end

NS_ASSUME_NONNULL_END

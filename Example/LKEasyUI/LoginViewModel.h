//
//  LoginViewModel.h
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <LKNetwork/LKNetwork.h>
#import "LoginParamVerify.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *password;


@property (nonatomic, strong, readonly) RACSignal<LoginParamVerifyResult *> *phoneValidateRs;
@property (nonatomic, strong) RACSignal<LoginParamVerifyResult *> *pwdValidateRs;
@property (nonatomic, strong, readonly) RACSignal<NSNumber *> *loginEnable;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;
@end

NS_ASSUME_NONNULL_END

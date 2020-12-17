//
//  LoginViewModel.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel()
@property (nonatomic, strong) LoginParamVerify * ps;
@end

@implementation LoginViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    __weak typeof(self) weakSelf = self;
    _phoneValidateRs = [RACObserve(self, phone) map:^id _Nullable(NSString * _Nullable value) {
        return [weakSelf.ps verifyPhoneNumber:value];
    }];
    _pwdValidateRs = [RACObserve(self, password) map:^id _Nullable(NSString * _Nullable value) {
        return [weakSelf.ps verifypassword:value];
    }];
    _loginEnable = [RACSignal combineLatest:@[_phoneValidateRs,_pwdValidateRs] reduce:^id _Nonnull(LoginParamVerifyResult *v1,LoginParamVerifyResult * v2){
        return @(v1.isVailed && v2.isVailed);
    }];
    
    
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
       NSDictionary *param = @{@"cellphoneNo":weakSelf.phone,@"code":weakSelf.password,@"cId":@"1"};
        return [self loginRequest:param];
    }];
    

    
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"正在执行中……");
        }else{
            NSLog(@"执行结束了");
        }
    }];
}
- (RACSignal *)loginRequest:(NSDictionary *)param{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        LKRequest *login = [LKRequest createPostRequestWithrequestUrl:@"appLogin/login.do" andParams:param];
        login.ignoreToken = YES;
        login.service_url = SERVICE_36550;
        
        [login startWithCompletionBlockWithSuccess:^(LKRequest *request) {
            LKUserModel *model = [LKUserModel mj_objectWithKeyValues:[request resResult].data];
            [[LKUserInfoManager sharedInstance] saveUserInfo:model];
            [subscriber sendNext:request];
            [subscriber sendCompleted];
        } failure:^(LKRequest *request) {
            [subscriber sendNext:request];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"结束了");
        }];
    }];
    
    RACSubject *sub = [RACSubject subject];
    
    LKRequest *login = [LKRequest createPostRequestWithrequestUrl:@"appLogin/login.do" andParams:param];
    login.ignoreToken = YES;
    login.service_url = SERVICE_36550;
    
    [login startWithCompletionBlockWithSuccess:^(LKRequest *request) {
        LKUserModel *model = [LKUserModel mj_objectWithKeyValues:[request resResult].data];
        [[LKUserInfoManager sharedInstance] saveUserInfo:model];
        [sub sendNext:request];
        [sub sendCompleted];
    } failure:^(LKRequest *request) {
        [sub sendNext:request];
        [sub sendCompleted];
    }];
    
    return sub;
}


- (LoginParamVerify *)ps{
    if (!_ps) {
        _ps = [[LoginParamVerify alloc]init];
    }
    return _ps;
}
@end

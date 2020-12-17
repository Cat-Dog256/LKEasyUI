//
//  LeeLoginViewController.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import "LeeLoginViewController.h"
#import "LoginView.h"
#import <Masonry/Masonry.h>
#import "LoginViewModel.h"
#import <LKNetwork.h>
@interface LeeLoginViewController ()
@property (nonatomic, strong) LoginView *loginView;

@property (nonatomic, strong) LoginViewModel *loginVM;

@end

@implementation LeeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self switchToLatest];
//    [self testCommand];
//    [self testNetRequestCommand];
    // Do any additional setup after loading the view.
}
- (void)testNetRequestCommand{
    RACCommand *command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            LKRequest *login = [LKRequest createPostRequestWithrequestUrl:@"appLogin/login.do" andParams:input];
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
    }];
    
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收数据 - %@",x);
    }];
    
    [command execute:@{@"cellphoneNo":@"17888836485",@"code":@"335577",@"cId":@"1"}];
}
- (void)testCommand{
 
    
    RACCommand * command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
        NSLog(@"%@",input);
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:@"达达的马蹄声"];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
//    [command.executionSignals subscribeNext:^(id  _Nullable x) {
//        NSLog(@"接收数据 - %@",x);
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"接收数据 - %@",x);
//        }];
//    }];
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收数据 - %@",x);
    }];
    [[command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
            if ([x boolValue]) {
                NSLog(@"还在执行");
            }else{
                NSLog(@"执行结束");
            }
    }];
    [command execute:@1];
}
- (void)switchToLatest
{
    RACSubject *signalOfSignals = [RACSubject subject];
    [signalOfSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    RACSubject *signal1 = [RACSubject subject];
    RACSubject *signal2 = [RACSubject subject];
    RACSubject *signal3 = [RACSubject subject];
    RACSubject *signal4 = [RACSubject subject];
    
    [signalOfSignals sendNext:signal1];
    [signalOfSignals sendNext:signal2];
    [signalOfSignals sendNext:signal3];
    [signalOfSignals sendNext:signal4];

    [signal1 sendNext:@"1"];
    [signal2 sendNext:@"2"];
    [signal3 sendNext:@"3"];
    [signal4 sendNext:@"4"];
}
- (void)makeUI{
 
    [self.view addSubview:self.loginView];
    
    __weak typeof(self) weakSelf = self;
  
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
        make.width.equalTo(@(KScreenWidth - 60));
        make.height.equalTo(@(weakSelf.loginView.loginView_H));
    }];
 
}
- (void)bindView{
    RAC(self.loginVM, phone) = self.loginView.phoneTf.rac_textSignal;
    RAC(self.loginView.phoneLab, text) = [self.loginVM.phoneValidateRs map:^id _Nullable(LoginParamVerifyResult * _Nullable value) {
        return value.message;
    }];
    
    RAC(self.loginView.phoneLab, textColor) = [self.loginVM.phoneValidateRs map:^id _Nullable(LoginParamVerifyResult * _Nullable value) {
        return value.textColor;
    }];
    
    RAC(self.loginVM, password) = self.loginView.passwordTf.rac_textSignal;
    
    RAC(self.loginView.paswordLab, text) = [self.loginVM.pwdValidateRs map:^id _Nullable(LoginParamVerifyResult * _Nullable value) {
        return value.message;
    }];
    
    RAC(self.loginView.paswordLab, textColor) = [self.loginVM.pwdValidateRs map:^id _Nullable(LoginParamVerifyResult * _Nullable value) {
        return value.textColor;
    }];
    
    
    RAC(self.loginView.loginBtn, enabled) = self.loginVM.loginEnable;
    
    __weak typeof(self) weakSelf = self;
    
    [self.loginVM.loginCommand.executionSignals.switchToLatest subscribeNext:^(LKRequest * _Nullable x) {
        if (x.resResult.success) {
            NSLog(@"%@",x.resResult.data);
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            NSLog(@"%@",x.resResult.message);
        }
        
    }];
    
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf.loginVM.loginCommand execute:nil];
    }];
}
- (LoginView *)loginView{
    if (!_loginView) {
        _loginView = [[LoginView alloc]init];
    }
    return _loginView;
}
- (LoginViewModel *)loginVM{
    if (!_loginVM){
        _loginVM = [[LoginViewModel alloc] init];
    }
    return _loginVM;
}


@end

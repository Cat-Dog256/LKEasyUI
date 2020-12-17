//
//  LoginView.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/14.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import "LoginView.h"
#import <Masonry/Masonry.h>
#import "LoginParamVerify.h"
@interface LoginView()
@property (nonatomic, strong) LoginParamVerify * ps;



@end

@implementation LoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self makeUI];
//        [self bindView];
    }
    return self;
}
- (void)makeUI{
    [self addSubview:self.phoneTf];
    [self.phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@6);
            make.right.equalTo(@-6);
            make.top.equalTo(@6);
            make.height.equalTo(@44);
    }];
    
    [self addSubview:self.phoneLab];
    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@6);
        make.right.equalTo(@-6);
        make.height.equalTo(@10);
        make.top.equalTo(self.phoneTf.mas_bottom).offset(2);
    }];
    
    [self addSubview:self.passwordTf];
    [self.passwordTf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@6);
            make.right.equalTo(@-6);
            make.top.equalTo(self.phoneLab.mas_bottom).offset(2);
            make.height.equalTo(@44);
    }];
    
    [self addSubview:self.paswordLab];
    [self.paswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@6);
        make.right.equalTo(@-6);
        make.height.equalTo(@10);
        make.top.equalTo(self.passwordTf.mas_bottom).offset(2);
    }];
    
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@6);
            make.right.equalTo(@-6);
            make.top.equalTo(self.paswordLab.mas_bottom).offset(2);
            make.height.equalTo(@44);
    }];
}
- (void)bindView{
    MJWeakSelf
    RACSignal *phoneSingal = [[self.phoneTf rac_textSignal] map:^id _Nullable(NSString*  _Nullable value) {
        return [weakSelf.ps verifyPhoneNumber:value];
     }];
    RAC(self.phoneLab, text) = [phoneSingal map:^id _Nullable(LoginParamVerifyResult *  _Nullable value) {
        return value.message;
    }];
    RAC(self.phoneLab, textColor) = [phoneSingal map:^id _Nullable(LoginParamVerifyResult *  _Nullable value) {
        return value.textColor;
    }];
    RACSignal *pwdSingal = [[self.passwordTf rac_textSignal] map:^id _Nullable(NSString*  _Nullable value) {
        return [weakSelf.ps verifypassword:value];
     }];
    RAC(self.paswordLab, text) = [pwdSingal map:^id _Nullable(LoginParamVerifyResult *  _Nullable value) {
        return value.message;
    }];
    RAC(self.paswordLab, textColor) = [pwdSingal map:^id _Nullable(LoginParamVerifyResult *  _Nullable value) {
        return value.textColor;
    }];
    
    RAC(self.loginBtn, enabled) = [RACSignal combineLatest:@[phoneSingal,pwdSingal] reduce:^id _Nullable(LoginParamVerifyResult *phRs,LoginParamVerifyResult *pwdRs){
        return @(phRs.isVailed && pwdRs.isVailed);
    }];
    

    
    self.loginSignal = [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id _Nullable(__kindof UIControl * _Nullable value) {
        
        return @{@"cellphoneNo":weakSelf.phoneTf.text,@"code":weakSelf.passwordTf.text,@"cId":@"1"};
    }];
}
- (CGFloat)loginView_H{
    return 6 + 44 + 14 + 44 + 14 + 44 +6;
}
- (LCTextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[LCTextField alloc]init];
        _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTf.placeholder = @"请输入手机号码";
        _phoneTf.isAccessibilityElement = YES;
        _phoneTf.accessibilityIdentifier = @"login_phone_tf";
        _phoneTf.accessibilityLabel = @"login_phone_tf";
        _phoneTf.text = @"17888836485";
    }
    return _phoneTf;
}
- (LoginParamVerify *)ps{
    if (!_ps) {
        _ps = [[LoginParamVerify alloc]init];
    }
    return _ps;
}
- (LCLabel *)phoneLab{
    if (!_phoneLab) {
        _phoneLab = [LCLabel labelWithFont:[UIFont systemFontOfSize:12] text:@""];
    }
    return _phoneLab;
}
- (LCTextField *)passwordTf{
    if (!_passwordTf) {
        _passwordTf = [[LCTextField alloc]init];
        _passwordTf.placeholder = @"请输入密码";
        _passwordTf.isAccessibilityElement = YES;
        _passwordTf.accessibilityIdentifier = @"login_pwd_tf";
        _passwordTf.text = @"335577";
    }
    return _passwordTf;
}
- (LCLabel *)paswordLab{
    if (!_paswordLab) {
        _paswordLab = [LCLabel labelWithFont:[UIFont systemFontOfSize:12] text:@""];
    }
    return _paswordLab;
}
- (LCButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[LCButton alloc]init];
        [_loginBtn setBackgroundColor:UIColor.orangeColor];

        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:UIColor.lightGrayColor forState:UIControlStateDisabled];
        [_loginBtn setCornerRadius:6];
        _loginBtn.enabled = NO;
        _loginBtn.isAccessibilityElement = YES;
        _loginBtn.accessibilityIdentifier = @"login_submit";
    }
    return _loginBtn;
}
@end
/*
 Dear Sir or Madam,
    Moved by the nobel cause of Project Hope and encouraged by what has happened achived so far, I would like to contribute to my bit to the project by financial aid to a child in a remote area in your province.
 I would be very grateful if you could help me seek out a girl who has just started schooling and whoes family cannot afford her education. My plan is to pay for her tuition on an annual basis until she finishies her secondary enducation. I would like to remit my donation directly to bank account opend by her family in her local area.
    Yours，
 Li Ming
 */

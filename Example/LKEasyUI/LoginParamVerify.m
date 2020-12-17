//
//  LoginParamVerify.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/15.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//


#import "LoginParamVerify.h"

@implementation  LoginParamVerifyResult



@end

@implementation LoginParamVerify
- (LoginParamVerifyResult *)verifyPhoneNumber:(NSString *)phone{
    LoginParamVerifyResult *rs = [[LoginParamVerifyResult alloc]init];
    if (phone.length == 0) {
        rs.textColor = UIColor.clearColor;
        rs.message = @"";
        rs.isVailed = NO;
    }else if (phone.length < 11){
        rs.textColor = UIColor.orangeColor;
        rs.message = @"电话号码长度小于11位";
        rs.isVailed = NO;
    } else if(phone.length == 11){
        rs.textColor = UIColor.greenColor;
        rs.message = @"电话号码长度等于11位";
        rs.isVailed = YES;
        return rs;
    }else{
        rs.textColor = UIColor.redColor;
        rs.message = @"电话号码长度大于11位";
        rs.isVailed = NO;
    }
    return rs;
}
- (LoginParamVerifyResult *)verifypassword:(NSString *)password{
    LoginParamVerifyResult *rs = [[LoginParamVerifyResult alloc]init];
    if (password.length == 0) {
        rs.textColor = UIColor.clearColor;
        rs.message = @"";
        rs.isVailed = NO;
    }else if (password.length < 6){
        rs.textColor = UIColor.orangeColor;
        rs.message = @"密码长度小于6位";
        rs.isVailed = NO;
    } else if(password.length>=6 && password.length<=16){
        rs.textColor = UIColor.greenColor;
        rs.message = @"密码格式符合要求";
        rs.isVailed = YES;
        return rs;
    }else{
        rs.textColor = UIColor.redColor;
        rs.message = @"电话号码长度大于16位";
        rs.isVailed = NO;
    }
    return rs;
}
@end

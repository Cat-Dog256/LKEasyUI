//
//  LoginParamVerify.h
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/15.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface LoginParamVerifyResult : NSObject
@property (nonatomic, assign) BOOL isVailed;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) UIColor *textColor;
@end
@interface LoginParamVerify : NSObject
- (LoginParamVerifyResult *)verifyPhoneNumber:(NSString *)phone;
- (LoginParamVerifyResult *)verifypassword:(NSString *)password;

@end

NS_ASSUME_NONNULL_END

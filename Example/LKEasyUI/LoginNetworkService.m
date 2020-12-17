//
//  LoginNetworkService.m
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import "LoginNetworkService.h"

@implementation LoginNetworkService
- (RACSignal *)login:(NSDictionary *)param{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"登录成功"];
        return nil;
    }];
}
@end

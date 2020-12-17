//
//  LoginNetworkService.h
//  LKEasyUI_Example
//
//  Created by mac on 2020/12/16.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginNetworkService : NSObject
- (RACSignal *)login:(NSDictionary *)param;
@end

NS_ASSUME_NONNULL_END

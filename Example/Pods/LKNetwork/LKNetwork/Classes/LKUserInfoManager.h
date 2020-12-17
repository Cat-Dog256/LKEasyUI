//
//  LKUserInfoManager.h
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/2.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKUserModel.h"
NS_ASSUME_NONNULL_BEGIN
FOUNDATION_EXTERN NSMutableDictionary const *_lk_sharedInstances;

@interface LKUserInfoManager : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@property (assign, readonly) BOOL isInitialized;

@property (nonatomic,copy, readonly) NSString *TOKEN;
@property (nonatomic,copy) NSString *Authorization;

+ (instancetype)sharedInstance;

+ (instancetype)instance;

+ (void)destroyInstance;

+ (void)destroyAllInstance;

- (void)saveUserInfo:(LKUserModel *)model;
- (LKUserModel *)readUserInfo;
- (BOOL)isLonined;
@end

NS_ASSUME_NONNULL_END

//
//  LKUserInfoManager.m
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/2.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import "LKUserInfoManager.h"
NSMutableDictionary const *_lk_sharedInstances = nil;

@implementation LKUserInfoManager{
    NSString *_token;
}

- (void)saveUserInfo:(LKUserModel *)model{
    _token = model.TOKEN;
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"user.data"];
    // Encoding
    [[NSKeyedArchiver archivedDataWithRootObject:model requiringSecureCoding:YES error:nil]writeToFile:file atomically:YES];
}
- (LKUserModel *)readUserInfo{
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"user.data"];
    // Decoding
    LKUserModel *user = [NSKeyedUnarchiver unarchivedObjectOfClass:[LKUserModel class] fromData:[NSData dataWithContentsOfFile:file] error:nil];
    return user;
}
- (BOOL)isLonined{
    LKUserModel * userinfo = [self readUserInfo];
    if (userinfo) {
        _token = userinfo.TOKEN;
        return YES;
    }else{
        return NO;
    }
}
- (NSString *)TOKEN{
    return _token;
}
#pragma mark -

+ (void)initialize {
    if (nil == _lk_sharedInstances) {
        _lk_sharedInstances = [NSMutableDictionary dictionary];
    }
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

+ (id)copyWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

#pragma mark -

+ (instancetype)sharedInstance {
    id sharedInstance = nil;
    @synchronized(self) {
        NSString *instanceClass = NSStringFromClass(self);
        sharedInstance = [_lk_sharedInstances objectForKey:instanceClass];
        if (sharedInstance == nil) {
            sharedInstance = [[super allocWithZone:nil] init];
            [_lk_sharedInstances setObject:sharedInstance forKey:instanceClass];
        }
    }
    
    return sharedInstance;
}

+ (instancetype)instance {
    return [self sharedInstance];
}

#pragma mark -

+ (void)destroyInstance {
    [_lk_sharedInstances removeObjectForKey:NSStringFromClass(self)];
}

+ (void)destroyAllInstance {
    [_lk_sharedInstances removeAllObjects];
}

#pragma mark -

- (id)init {
    self = [super init];
    if (self && !self.isInitialized) {
        _isInitialized = YES;
    }
    
    return self;
}


@end

//
//  LKRequest.m
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/2.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import "LKRequest.h"
@implementation LKRequest{
    NSDictionary *_requestParam;
    NSString *_requestUrl;
    YTKRequestMethod _requestMethod;
}
+ (instancetype)createGetRequestWithrequestUrl:(NSString *)requestUrl{
    return [[self alloc]initWithrequestUrl:requestUrl requestMethod:YTKRequestMethodGET andParams:nil];
}
+ (instancetype)createGetRequestWithrequestUrl:(NSString *)requestUrl
                                     andParams:(nonnull NSDictionary *)params{
    return [[self alloc]initWithrequestUrl:requestUrl requestMethod:YTKRequestMethodGET andParams:params];
}
+ (instancetype)createPostRequestWithrequestUrl:(NSString *)requestUrl
                                      andParams:(NSDictionary *)params
{
    return [[self alloc]initWithrequestUrl:requestUrl requestMethod:YTKRequestMethodPOST andParams:params];
}
+ (instancetype)createGetRequestPageListWithrequestUrl:(NSString *)requestUrl
                                             andParams:(nullable NSDictionary *)params
                                               pageNum:(NSInteger)pageNum{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    dict[@"pageNum"] = @(pageNum);
    return  [self createGetRequestWithrequestUrl:requestUrl andParams:dict];
}
- (instancetype)initWithrequestUrl:(NSString *)requestUrl
           requestMethod:(YTKRequestMethod)requestMethod
               andParams:(NSDictionary *)params {
    NSParameterAssert(requestUrl != nil && requestUrl.length > 0);

    self = [super init];
    if (self) {
        _requestParam = params;
        _requestUrl = requestUrl;
        _requestMethod = requestMethod;
        _ignoreToken = NO;
        self.service_url = SERVICE_36547;
    }
    return self;
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(LKRequest * _Nonnull))success failure:(void (^)(LKRequest * _Nonnull))failure{
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}
- (NSString *)baseUrl{
    switch (self.service_url) {
        case SERVICE_36550:
            return @"http://219.159.44.172:36550/";
        case SERVICE_36547:
            return @"http://219.159.44.172:36547/";
        default:
            return @"";
    }
}
- (NSString *)requestUrl {
    return _requestUrl;
}

- (YTKRequestMethod)requestMethod {
    return _requestMethod;
}

- (id)requestArgument {
    return _requestParam;
}
- (NSDictionary *)requestHeaderFieldValueDictionary {
    switch (self.service_url) {
        case SERVICE_36550:{
            if (self.ignoreToken) {
                return @{@"Content-Type":@"application/x-www-form-urlencoded",
                         @"api-version" :@"1"
                };
            }else{

                if ([[LKUserInfoManager sharedInstance] isLonined] == NO) {
                    NSLog(@"please get token first");
                    return nil;
                }
                NSParameterAssert([LKUserInfoManager sharedInstance].TOKEN != nil && @"please get TOKEN first");
                return @{@"Accept":@"*/*",
                         @"x-access-token":[LKUserInfoManager sharedInstance].TOKEN,
                         @"api-version" :@"1"
                };
            }
        }
        case SERVICE_36547:
            if (self.ignoreToken) {
                return nil;
            }
            NSParameterAssert([LKUserInfoManager sharedInstance].Authorization != nil && @"please get Authorization first");
        
            return @{@"Authorization":[LKUserInfoManager sharedInstance].Authorization};
        default:
            return nil;
    }
}


- (LKResponse *)resResult{
    LKResponse *res = [LKResponse mj_objectWithKeyValues:[self responseJSONObject]];
    if (res) {
        return res;
    }else{
        LKResponse *res = [[LKResponse alloc]init];
        res.errorType = @"本地错误";
        res.message = @"请检查请求路径";
        res.success = NO;
        return res;
    }
}

- (id)responseJSONObject {
    return [super responseJSONObject];
}
///处理被踢下线，重新登陆
- (void)requestFailedFilter{
    if ([self resResult].success == NO && self.responseStatusCode == 301) {
        NSLog(@"%@",[self resResult].message);
        NSLog(@"%@",[self resResult].msg);
        NSLog(@"被踢下线，重新登陆");
    }
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeHTTP;
}
- (YTKResponseSerializerType)responseSerializerType{
    return YTKResponseSerializerTypeJSON;
}
@end

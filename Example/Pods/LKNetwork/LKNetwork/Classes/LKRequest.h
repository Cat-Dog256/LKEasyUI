//
//  LKRequest.h
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/2.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import "LKResponse.h"
#import "LKUserInfoManager.h"
#import <YTKNetwork/YTKNetwork.h>
#import <MJExtension/MJExtension.h>
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    SERVICE_36550,
    SERVICE_36547,
    SERVICE_40037,
} SERVICE_ADDRESS_TYPE;
@interface LKRequest : YTKRequest
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// 请求成功返回的数据
@property (nonatomic, strong, readonly) LKResponse *resResult;

/// 服务器地址，默认 SERVICE_36547
@property (nonatomic, assign) SERVICE_ADDRESS_TYPE service_url;

/// 不需要token的Api 设置为YES，默认NO
@property (nonatomic, assign) BOOL ignoreToken;

- (instancetype)initWithrequestUrl:(NSString *)requestUrl
           requestMethod:(YTKRequestMethod)requestMethod
                         andParams:(nullable NSDictionary *)params;

+ (instancetype)createGetRequestWithrequestUrl:(NSString *)requestUrl;

+ (instancetype)createGetRequestWithrequestUrl:(NSString *)requestUrl
                                     andParams:(NSDictionary *)params;

+ (instancetype)createPostRequestWithrequestUrl:(NSString *)requestUrl
                                      andParams:(NSDictionary *)params;

+ (instancetype)createGetRequestPageListWithrequestUrl:(NSString *)requestUrl
                                             andParams:(nullable NSDictionary *)params
                                               pageNum:(NSInteger)pageNum;

///  Convenience method to start the batch request with block callbacks.
- (void)startWithCompletionBlockWithSuccess:(nullable void (^)(LKRequest *request))success
                                    failure:(nullable void (^)(LKRequest *request))failure;

@end

NS_ASSUME_NONNULL_END

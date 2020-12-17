//
//  LKUploadRequest.h
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/3.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import "LKRequest.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LKUploadRequest : LKRequest
+ (instancetype)uploadImagesRequestWithrequestUrl:(NSString *)requestUrl
                                      andParams:(NSDictionary *)params
                                        andImages:(NSArray<UIImage *> *)images;
@end

NS_ASSUME_NONNULL_END

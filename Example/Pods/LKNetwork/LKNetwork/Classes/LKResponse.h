//
//  LKResponse.h
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/2.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LKResponse : NSObject
@property (nonatomic, copy) NSDictionary *data;
@property (nonatomic, copy) NSString *errorType;
@property (nonatomic, copy) NSArray *listData;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) BOOL success;

@property (nonatomic, assign) BOOL hasNext;
@property (nonatomic, assign) NSUInteger pageNum;
@property (nonatomic, assign) NSUInteger code;
@property (nonatomic, copy) NSString *msg;
@end

NS_ASSUME_NONNULL_END

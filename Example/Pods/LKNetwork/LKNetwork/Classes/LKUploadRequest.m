//
//  LKUploadRequest.m
//  YTKNetworkDemo
//
//  Created by mac on 2020/12/3.
//  Copyright © 2020 yuantiku.com. All rights reserved.
//

#import "LKUploadRequest.h"
#import <AFNetworking/AFURLRequestSerialization.h>

@implementation LKUploadRequest{
    NSArray<UIImage *> *_images;
}
+ (instancetype)uploadImagesRequestWithrequestUrl:(NSString *)requestUrl andParams:(NSDictionary *)params andImages:(NSArray<UIImage *> *)images{
    return [self createPostRequestWithrequestUrl:requestUrl andParams:params];
}
- (instancetype)initWithrequestUrl:(NSString *)requestUrl
           requestMethod:(YTKRequestMethod)requestMethod
               andParams:(NSDictionary *)params
                         andImages:(NSArray<UIImage *> *)images{
    self = [super initWithrequestUrl:requestUrl requestMethod:YTKRequestMethodPOST andParams:params];
    if (self) {
        _images = images;
        self.service_url = SERVICE_36547;
    }
    return self;
    
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        // 将多张图片一次性上传到后台，后台将数据一对应Array格式取出
        for (NSInteger i = 0; i < _images.count; i++) {
            UIImage *image = _images[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSString *fileName =[NSString stringWithFormat:@"image_ios_%ld.png", (long)i];
            NSString *type = @"image/png";
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:type];
        }
    };
}

@end

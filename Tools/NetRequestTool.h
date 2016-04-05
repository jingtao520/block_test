//
//  NetRequestTool.h
//  block_test
//
//  Created by zhengda on 16/3/28.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetRequestTool : NSObject
#pragma 监测网络的可连接性
+ (BOOL)NetWorkReachablityWithURLString:(NSString *)strUrl;


#pragma POST 请求
+ (void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString
                       WithParameter:(NSDictionary *)parameter
               WithReturnValueBloock:(ReturnValueBlock)SuccessBlock
                  WithErrorCodeBlock:(ErrorValueBlock)errorBlock
                    WithFailureBlock:(FailureValueBlock)failureBlock;

#pragma GET 请求
+ (void)NetRequestGETWithURLS:(NSString *)requestURLString
                WithParameter:(NSDictionary *)parameter
         WithReturnValueBlock:(ReturnValueBlock)SuccessBlock
           WithErrorCodeBlock:(ErrorValueBlock)ErrorCode
             WirhFailureBlock:(FailureValueBlock)Failureblock;

@end

//
//  NetRequestTool.m
//  block_test
//
//  Created by zhengda on 16/3/28.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import "NetRequestTool.h"

@implementation NetRequestTool

#pragma 监测网络的可链接性

+ (BOOL)NetWorkReachablityWithURLString:(NSString *)strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [operationQueue setSuspended:NO ];
                netState = YES;
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];

                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
    
}
#pragma --mark GET请求方式
+ (void)NetRequestGETWithURLS:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValueBlock:(ReturnValueBlock)SuccessBlock WithErrorCodeBlock:(ErrorValueBlock)ErrorCode WirhFailureBlock:(FailureValueBlock)Failureblock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        ZTLog(@"%@",dic);
        
//        if (dic) {
//            <#statements#>
//        }
        
        SuccessBlock(dic);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        ZTLog(@"%@",[error description]);
        
        Failureblock(error);
        
    }];
    
}
+ (void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValueBloock:(ReturnValueBlock)SuccessBlock WithErrorCodeBlock:(ErrorValueBlock)errorBlock WithFailureBlock:(FailureValueBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//将数据转化为NSData

    [manager POST:requestURLString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil ];
        
        if (SuccessBlock) {
            SuccessBlock(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        ZTLog(@"%@",[error description]);
        
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
}

@end

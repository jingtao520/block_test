
//
//  Config.h
//  block_test
//
//  Created by zhengda on 16/3/28.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#ifndef Config_h
#define Config_h

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorValueBlock) (id errorCode);
typedef void (^FailureValueBlock) (id failureCode);
//typedef void (^NetWorkBlock) (BOOL netConnectState);
//typedef void (^NetWorkBlock) (id netConnetState);
#define ZTLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

//#import <AFNetworking.h>



#endif /* Config_h */

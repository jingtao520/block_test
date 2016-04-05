//
//  CollectModel.h
//  block_test
//
//  Created by zhengda on 16/3/29.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectModel : NSObject


@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;

//裁剪后的图片
@property (nonatomic, strong) UIImage *clipedImage;


@end

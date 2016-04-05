//
//  TwoVC.h
//  block_test
//
//  Created by zhengda on 16/3/21.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TwoVC.h"



// 代理传值
//@protocol SecondVCdelegate <NSObject>
//
//@optional
//- (void)setLabelText:(NSString *)text;
//
//@end
typedef void (^MyBlock) (NSString *LabelStr);

@interface TwoVC : UIViewController
//声明block 属性
@property (nonatomic, strong) MyBlock returnTextBlock;
//@property (nonatomic, strong) id<SecondVCdelegate> delegate;
// 声明的调用方法
- (void)returnText:(MyBlock)block;

@end

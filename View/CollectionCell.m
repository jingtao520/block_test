//
//  CollectionCell.m
//  block_test
//
//  Created by zhengda on 16/3/29.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import "CollectionCell.h"

@interface CollectionCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *imageview1;


@end


@implementation CollectionCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
      
        
        self.imageview1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self.contentView addSubview:self.imageview1];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 20)];
        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.layer.masksToBounds = YES;
    }
    
    return self;
}
- (void)configCellWithModel:(CollectModel *)model
{
    if (model.clipedImage) {
        self.imageview1.layer.contents = (__bridge id _Nullable)(model.clipedImage.CGImage);
    } else {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            UIImage *image = [UIImage imageNamed:model.imageName];
            image = [self clipImage:image toSize:self.imageview1.frame.size];
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                model.clipedImage = image;
                self.imageview1.layer.contents = (__bridge id _Nullable)(model.clipedImage.CGImage);
                
            });
        });
    }
    
    self.titleLabel.text = model.title;
    
    
}
- (UIImage *)clipImage:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    CGSize imgSize = image.size;
    CGFloat x = MAX(size.width / imgSize.width, size.height / imgSize.height);
    CGSize resultSize = CGSizeMake(x * imgSize.width, x * imgSize.height);
    
    [image drawInRect:CGRectMake(0, 0, resultSize.width, resultSize.height)];
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
}

@end

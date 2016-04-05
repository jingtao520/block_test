//
//  TwoVC.m
//  block_test
//
//  Created by zhengda on 16/3/21.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import "TwoVC.h"
#import "OneVC.h"
#import "ThreeVC.h"



@interface TwoVC ()
@property (weak, nonatomic) IBOutlet UILabel *LableName;

@property (nonatomic, strong) UITextField *intPutTF;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *nextBtn;


@end

@implementation TwoVC

- (void)returnText:(MyBlock)block
{
    self.returnTextBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.intPutTF.text);
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _intPutTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 250, [UIScreen mainScreen].bounds.size.width-160, 100)];
    
    
    _intPutTF.backgroundColor = [UIColor redColor];
    
    _intPutTF.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_intPutTF];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(80, 100, [UIScreen mainScreen].bounds.size.width-160, 50);
    [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    
    [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _backBtn.backgroundColor = [UIColor greenColor];
    
    
    [self.view addSubview:_backBtn];
    
    [self creatCollectionBtn];
    
}
- (void)creatCollectionBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(80, 400, [UIScreen mainScreen].bounds.size.width-160, 80);
    
    self.nextBtn = btn;
    
    btn.backgroundColor = [UIColor greenColor];
    
    [btn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"下一个" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}
- (void)nextBtnClick
{
    ThreeVC *thVC = [[ThreeVC alloc] init];
    
    
    [self presentViewController:thVC animated:YES completion:^{
        
    }];
    
    
    
    
}
- (void)backBtnClick:(UIButton *)sender
{
    // 代理的方法
//    if ([self.delegate respondsToSelector:@selector(setLabelText:)]) {
//        NSString *text = self.intPutTF.text;
//        [self.delegate setLabelText:text];
//    }
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

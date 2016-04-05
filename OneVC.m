//
//  OneVC.m
//  block_test
//
//  Created by zhengda on 16/3/21.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import "OneVC.h"
#import "TwoVC.h"



@interface OneVC ()
//<SecondVCdelegate>
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;

@property (nonatomic, strong) UILabel *labelThere;
@property (nonatomic, strong) TwoVC *secondVC;

@end

@implementation OneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
    self.labelThere = [[UILabel alloc] initWithFrame:CGRectMake(80, 300, self.view.frame.size.width-160, 100)];
    
    self.labelThere.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.labelThere];
    
    TwoVC *second = [[TwoVC alloc] init];
    // 调用 block 得到传过来的值
    [second returnText:^(NSString *LabelStr) {
       
        self.labelThere.text = LabelStr;
        
    }];
    
    self.secondVC = second;
    // 代理的
//    self.secondVC.delegate = self;
    
    
    [self creatUIBezierPathTest];
    
    
    
}
- (void)creatUIBezierPathTest
{
    
    ZTLog(@"贝塞尔曲线");
    
}

#pragma mark - Two-SecondVCdelegate
//- (void)setLabelText:(NSString *)text
//{
//    self.labelThere.text = text;
//}

- (IBAction)pushBtnClick:(UIButton *)sender {


    
//    TwoVC *two = [[TwoVC alloc] init];
    
    [self presentViewController:self.secondVC animated:YES completion:nil];
    

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

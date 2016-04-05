//
//  ThreeVC.m
//  block_test
//
//  Created by zhengda on 16/3/29.
//  Copyright © 2016年 zdsd. All rights reserved.
//

#import "ThreeVC.h"
#import "CollectionCell.h"
#import "CollectModel.h"


#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
static NSString *cellIdentifier = @"gridcellidentifier";



@interface ThreeVC () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self creatCollectView];
    

}
- (void)creatCollectView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(130, 160);
    layout.minimumInteritemSpacing = 15;
    layout.minimumLineSpacing = 10;
    layout.headerReferenceSize = CGSizeMake(130, 20);
    layout.footerReferenceSize = CGSizeMake(130, 30);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    //填充数据
    
    int j = 0;
    for (NSUInteger i = 0; i < 60; ++ i) {
        if (++ j > 12) {
            j = 1;
        }
        
        CollectModel *model = [[CollectModel alloc] init];
        model.imageName = [NSString stringWithFormat:@"img%d.jpg",j];
        model.title = [NSString stringWithFormat:@"item%ld",i];
        
        [self.dataSource addObject:model];
        
    }
    
    [self.collectionView reloadData];
    
}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [[UICollectionView alloc] initWithFrame:<#(CGRect)#> collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>];
//    }
    
    CollectModel *model = self.dataSource[indexPath.item];
    
    [cell configCellWithModel:model];
    
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
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

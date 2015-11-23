//
//  FreeHeroCollectionViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FreeHeroCollectionViewController.h"
#import "FreeHeroCollectionViewCell.h"
#import "FreeHero.h"
#import "YXXQViewController.h"

@interface FreeHeroCollectionViewController ()
@property(nonatomic,retain)NSDictionary * dic;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSString * string;

@end

@implementation FreeHeroCollectionViewController

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if ([super initWithCollectionViewLayout:layout]) {
        self.title = @"免费英雄";
        self.tabBarItem.image = [[UIImage imageNamed:@"1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    }
    return self;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:kMFYX parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        self.dic = responseObject;
        _string = _dic[@"desc"];
        NSArray * array = [NSArray arrayWithArray:_dic[@"free"]];
        _array = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            FreeHero * freeHero = [[FreeHero alloc]init];
            [freeHero setValuesForKeysWithDictionary:dic];
            [_array addObject:freeHero];
            [self.collectionView reloadData];
           }
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
    }];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(self.view.frame.size.width/2, 65);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[FreeHeroCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
//    self.title = @"免费英雄";

   
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FreeHeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    FreeHero * freeHero = _array[indexPath.row];
    cell.freeHero = freeHero;

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YXXQViewController * YXXQVC = [[YXXQViewController alloc]init];
    FreeHero * freeHero = _array[indexPath.row];
    YXXQVC.title = freeHero.title;
    YXXQVC.enName = freeHero.enName;
    [self.navigationController pushViewController:YXXQVC animated:YES];
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

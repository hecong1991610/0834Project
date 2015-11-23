//
//  AllHeroCollectionViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AllHeroCollectionViewController.h"
#import "FreeHeroCollectionViewCell.h"
#import "FreeHero.h"
#import "AllHeroCollectionViewCell.h"
#import "YXXQViewController.h"

@interface AllHeroCollectionViewController ()
@property(nonatomic,retain)NSMutableArray * array;
@property(nonatomic,retain)FreeHero * freeHero;
@end

@implementation AllHeroCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if ([super initWithCollectionViewLayout:layout]) {
        self.title = @"所有英雄";
        self.tabBarItem.image = [[UIImage imageNamed:@"2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4, [UIScreen mainScreen].bounds.size.width/4+20);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[AllHeroCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:kQBYX parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        NSDictionary * dic = responseObject;
        NSLog(@"%@",dic);
        NSArray * array = dic[@"all"];
        _array = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            self.freeHero = [[FreeHero alloc]init];
            [_freeHero setValuesForKeysWithDictionary:dic];
            [_array addObject:_freeHero];
            [self.collectionView reloadData];
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
    }];
    self.title = @"所有英雄";

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    
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
    NSLog(@"array = %ld",_array.count);
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AllHeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    _freeHero = _array[indexPath.row];
    cell.hero = _freeHero;
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YXXQViewController * YXXQVC = [[YXXQViewController alloc]init];
    _freeHero = _array[indexPath.row];
    YXXQVC.title = _freeHero.title;
    YXXQVC.enName = _freeHero.enName;
    [self.navigationController pushViewController:YXXQVC animated:YES];
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*ss
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

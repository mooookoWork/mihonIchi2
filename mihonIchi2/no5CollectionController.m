//
//  no5CollectionController.m
//  mihonIchi2

//  コレクションビューを使った画面

//  Created by mooooko on 2014/05/21.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import "no5CollectionController.h"

@interface no5CollectionController ()

@end

@implementation no5CollectionController
@synthesize iconArray;
@synthesize titleArray;

static NSString *CellIdentifer = @"Cell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"コレクション";
    
    [self setIconArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//セルの表示設定
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifer forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}
//セクション数の設定
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//セル数の設定
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return iconArray.count;
}
//試験中のメソッド
-(void)setIconArray{
    iconArray = [NSMutableArray array];
    for (int i = 1; i <= 26; i++) {
        NSString *iconName = [NSString stringWithFormat:@"0%d.png",i];
        [iconArray addObject:[UIImage imageNamed:iconName]];
        
        NSLog(@"いまここ%@",iconName);
    }
}
-(void)setTitleArray{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

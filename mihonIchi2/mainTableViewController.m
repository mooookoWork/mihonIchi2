//
//  mainTableViewController.m
//  mihonIchi2

//  トップページ　普通のテーブルビュー

//  Created by mooooko on 2014/05/18.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import "mainTableViewController.h"

@interface mainTableViewController ()

@end

@implementation mainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"見本市２";
    [self setTblList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source
//テーブルのセル表示数設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return _tblList.count;
}
//テーブルのセクション数設定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

//テーブルの表示内容設定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //インデックスの保持
    int index = [indexPath indexAtPosition:[indexPath length]- 1];
    
    NSString *CellIdentifer = [_tblList objectAtIndex:index];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
  
    cell.textLabel.text = [_tblList objectAtIndex:indexPath.row];
    return cell;
}
-(void)setTblList{
   _tblList = @[@"建設中",
                @"建設中",
                @"建設中",
                @"建設中",
                @"建設中",
                @"建設中"];
}
@end

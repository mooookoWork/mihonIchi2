//
//  no2TableViewController.m
//  mihonIchi2

//  編集できるテーブルビュー
//  Created by mooooko on 2014/05/18.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import "no2TableViewController.h"

@interface no2TableViewController ()

@end

@implementation no2TableViewController

@synthesize str2Array;
@synthesize no2Tbl;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

//読込時の動作設定
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"No.2";
    
    [self setStr2Array];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//テーブルのセクション数の設定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
//テーブルのセル数の設定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return str2Array.count;
}

//テーブルのセルの表示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = [indexPath indexAtPosition:[indexPath length]- 1];
    
    NSString *CellIdentifer = [str2Array objectAtIndex:index];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [str2Array objectAtIndex:indexPath.row];
    
    
    return cell;
}

//テーブルを編集可能にする
-(IBAction)setTOEdit:(id)sender{
    if (no2Tbl.isEditing) {
        [self setEditing:false animated:YES];
    }else{
        [self setEditing:true animated:YES];
    }
}
//テーブルのセルを編集可能にする
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return NO;
    }
    return YES;
}

//セルの表示データ（仮）取得
-(void)setStr2Array{
    str2Array = [[NSMutableArray alloc] initWithObjects:@"建設中",
                 @"建設",
                 @"建設",nil];
}
//テーブルの編集形式の設定
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (str2Array.count == indexPath.row+1) {
        return UITableViewCellEditingStyleInsert;
    }else{
         return UITableViewCellEditingStyleDelete;
    }
}
//テーブルの編集
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cnt = str2Array.count;
    NSString *strMsg = @"新たに建設中";
    NSString *strInsert = [strMsg stringByAppendingFormat:@"その%d",cnt];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //セル削除時の動作
        [str2Array removeObjectAtIndex:indexPath.row];
        
        [no2Tbl deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //セル挿入時の動作
        
        [str2Array insertObject:strInsert
                                 atIndex:cnt - 1];
        [no2Tbl insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}
// テーブルのデータを移動１
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return NO;
    }else{
        return YES;
    }
}
// テーブルのデータを移動２
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    
    NSLog(@"移動しますた");
}

@end

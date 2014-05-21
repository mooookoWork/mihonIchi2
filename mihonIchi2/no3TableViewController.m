//
//  no3TableViewController.m
//  mihonIchi2
//
//  Created by mooooko on 2014/05/19.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import "no3TableViewController.h"
#import "mkoCustomCell.h"

@interface no3TableViewController ()

@end

@implementation no3TableViewController

@synthesize no3Tbl;
@synthesize str3Array;
@synthesize nib;
@synthesize cell;

static NSString *CellIdentifer = @"mkoCustomCell";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"カスタムセル";
    
    //nibファイルmkoCustomCellの読み込み
    nib = [UINib nibWithNibName:@"mkoCustomCell" bundle:nil];
    
    [no3Tbl registerNib:nib forCellReuseIdentifier:CellIdentifer];
    
    [self getStr3Array];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return str3Array.count;
}
-(void)getStr3Array{
    str3Array = [[NSMutableArray alloc] initWithObjects:@"1",
                 @"2",
                 @"3",
                 @"4",
                 @"5",
                 @"6",
                 nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //インデックスの保持
    int index = [indexPath indexAtPosition:[indexPath length]- 1];

    
    cell = [no3Tbl dequeueReusableCellWithIdentifier:CellIdentifer forIndexPath:indexPath];
    cell.textLabel.text = [str3Array objectAtIndex:index];
    
    
    //セル選択時の背景色設定
    UIView *selected_bg_view = [[UIView alloc] initWithFrame:cell.bounds];
    selected_bg_view.backgroundColor = [UIColor redColor];
    
    selected_bg_view.alpha = 0.1;
    cell.selectedBackgroundView = selected_bg_view;

    return cell;
}
//セルのタップ時のイベント
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int cnt = indexPath.row;
    
    
    NSLog(@"あなたがいるのは%d、今ここ",cnt);

}

//セルの高さ設定
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

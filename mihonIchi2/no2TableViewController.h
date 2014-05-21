//
//  no2TableViewController.h
//  mihonIchi2
//
//  Created by mooooko on 2014/05/18.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface no2TableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnNEdit;


@property IBOutlet UITableView *no2Tbl;
@property NSMutableArray *str2Array;

-(IBAction)setTOEdit:(id)sender;

@end

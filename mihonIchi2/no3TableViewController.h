//
//  no3TableViewController.h
//  mihonIchi2
//
//  Created by mooooko on 2014/05/19.
//  Copyright (c) 2014年 MooookoWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mkoCustomCell.h"

@interface no3TableViewController : UITableViewController
@property IBOutlet UITableView *no3Tbl;

@property NSMutableArray *str3Array;

@property UINib *nib;

@property mkoCustomCell *cell;

@end

//
//  TableViewController.m
//  segue_delegate_block
//
//  Created by zijia on 5/25/.
//  Copyright (c) 2016 zijia. All rights reserved.
//

#import "TableViewController.h"
#import "addViewController.h"
#import "XMGContact.h"

#define path [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"datas.data"]

@interface TableViewController () <addViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation TableViewController 


- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.datas = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}


- (void)addViewDelegatecontact:(XMGContact *)contact
{
    [self.datas addObject:contact];
    
    [self.tableView reloadData];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    addViewController *vc = segue.destinationViewController;
    vc.delegate = self;
   
    vc.title = @"addController";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
        [NSKeyedArchiver archiveRootObject:self.datas toFile:path];
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    
    // 获取模型
    XMGContact *c = self.datas[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.datas removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [NSKeyedArchiver archiveRootObject:self.datas toFile:path];
}


@end

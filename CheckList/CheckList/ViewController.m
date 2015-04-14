//
//  ViewController.m
//  CheckList
//
//  Created by Chujie Zeng on 4/11/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "ViewController.h"
#import "CheckListItem.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *_items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] initWithCapacity:10];
    
    CheckListItem *item;
    item = [[CheckListItem alloc] init];
    item.text = @"Hello~";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"World!";
    item.checked = NO;
    [_items addObject:item];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

- (void)configureCheckMarkForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item {
    BOOL isChecked = NO;
    isChecked = item.checked;
    if (!isChecked) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 12, 345, 21)];
    label.text = item.text;
    [cell.contentView addSubview:label];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    CheckListItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withCheckListItem:item];
    [self configureCheckMarkForCell:cell withCheckListItem:item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CheckListItem *item = _items[indexPath.row];
    [item toggleCheck];
    
    [self configureCheckMarkForCell:cell withCheckListItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)addItem:(id)sender {
    NSInteger newRowIndex = [_items count];
    
    CheckListItem *newItem = [[CheckListItem alloc] init];
    newItem.text = @"Oh~";
    newItem.checked = NO;
    [_items addObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    [_items removeObjectAtIndex:row];
    
    NSArray *indexPaths = @[indexPath];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end

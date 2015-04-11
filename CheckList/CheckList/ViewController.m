//
//  ViewController.m
//  CheckList
//
//  Created by Chujie Zeng on 4/11/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
//    label.text = [NSString stringWithFormat:@"日了%ld条🐶", indexPath.row];
//    label.tag = 1234;
//    [cell.contentView addSubview:label];
    UILabel *shit = (UILabel*)[cell.contentView viewWithTag:1234];
    NSLog(@"%@  %ld", shit.text, indexPath.row);
    shit.text = [NSString stringWithFormat:@"日了%ld条狗", indexPath.row];
    return cell;
}

@end

//
//  AddItemController.m
//  CheckList
//
//  Created by Chujie Zeng on 4/15/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "AddItemController.h"

@implementation AddItemController

- (IBAction)cancel:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


@end

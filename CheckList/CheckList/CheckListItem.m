//
//  CheckListItem.m
//  CheckList
//
//  Created by Chujie Zeng on 4/14/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "CheckListItem.h"

@implementation CheckListItem

@synthesize checked;

- (void)toggleCheck {
    checked = !checked;
}

@end

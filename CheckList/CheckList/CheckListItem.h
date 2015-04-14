//
//  CheckListItem.h
//  CheckList
//
//  Created by Chujie Zeng on 4/14/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckListItem : NSObject

@property (copy, nonatomic) NSString *text;
@property (assign, nonatomic) BOOL checked;

- (void)toggleCheck;

@end

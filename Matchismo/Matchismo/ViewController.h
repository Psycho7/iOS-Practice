//
//  ViewController.h
//  Matchismo
//
//  Created by Chujie Zeng on 4/12/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//
//  Abstract Class

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// Abstract Method
- (Deck *)createDeck;

@end


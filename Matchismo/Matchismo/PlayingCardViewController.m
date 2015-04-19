//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Chujie Zeng on 4/19/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end

//
//  Deck.h
//  Matchismo
//
//  Created by Chujie Zeng on 4/12/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end

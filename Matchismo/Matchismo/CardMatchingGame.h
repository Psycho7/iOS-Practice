//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Chujie Zeng on 4/18/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)getCardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end

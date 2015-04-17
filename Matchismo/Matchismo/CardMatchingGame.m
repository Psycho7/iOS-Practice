//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Chujie Zeng on 4/18/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                return nil;
            }
        }
    }
    
    return self;
}

- (Card *)getCardAtIndex:(NSUInteger)index {
    if (index < [self.cards count]) {
        return self.cards[index];
    } else {
        return nil;
    }
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define COST_TO_CHOOSE 1

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self getCardAtIndex:index];
    
    if (card) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *anotherCard in self.cards) {
                if (anotherCard.isChosen && !anotherCard.isMatched) {
                    NSInteger matchScore = [card match:@[anotherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        anotherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        anotherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end

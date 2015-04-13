//
//  PlayingCard.h
//  Matchismo
//
//  Created by Chujie Zeng on 4/12/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

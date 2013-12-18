//
//  ViewController.m
//  SuperCard
//
//  Created by Priyanjana Bengani on 17/12/2013.
//  Copyright (c) 2013 anothercookiecrumbles. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
#import "MatchismoPlayingCardDeck.h"
#import "MatchismoPlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) MatchismoDeck* deck;
@end

@implementation ViewController

- (MatchismoDeck*) deck{
    if (!_deck) _deck = [[MatchismoPlayingCardDeck alloc] init];
    return _deck;
}

- (void) drawRandomPlayingCard {
    MatchismoCard* card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[MatchismoPlayingCard class]]) {
        MatchismoPlayingCard* playingCard = (MatchismoPlayingCard*) card;
        self.playingCardView.suit = playingCard.suit;
        self.playingCardView.rank = playingCard.rank;
    }
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    if (!self.playingCardView.faceUp) [self drawRandomPlayingCard];
    self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.playingCardView.suit = @"♣︎";
    self.playingCardView.rank = 13;
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView
                                                                                         action:@selector(pinch:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

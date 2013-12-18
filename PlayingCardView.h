//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Priyanjana Bengani on 17/12/2013.
//  Copyright (c) 2013 anothercookiecrumbles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic,strong) NSString* suit;
@property (nonatomic) BOOL faceUp;

- (void) pinch:(UIPinchGestureRecognizer*) gesture;
@end

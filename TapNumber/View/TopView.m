//
//  TopView.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "TopView.h"
#import "NotificationManager.h"


@interface TopView()

@property (strong, nonatomic) id<TopViewDelegate> delegate;

@end

@implementation TopView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"topview");
        self.delegate = delegate;
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat buttonWidth = frame.size.width /3;
        CGFloat buttonHeight = frame.size.height /5;
        
        UIButton *newGameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [newGameBtn setTitle:@"NEW GAME" forState:UIControlStateNormal];
        newGameBtn.frame = CGRectMake(frame.size.width/3, frame.size.height *0.4, buttonWidth, buttonHeight);
        [newGameBtn addTarget:self action:@selector(newGameTap) forControlEvents:UIControlEventTouchUpInside];
        
        //UIImage *btnBackImage = [UIImage imageNamed:@"Icon_Back.png"];
        //[newGameBtn setImage:btnBackImage forState:UIControlStateNormal];
        newGameBtn.autoresizingMask=(UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin);
        
        
        UIButton *highScoreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [highScoreBtn setTitle:@"HIGH SCORE" forState:UIControlStateNormal];
        highScoreBtn.frame = CGRectMake(frame.size.width/3, frame.size.height *0.4 + buttonHeight, buttonWidth, buttonHeight);
        [highScoreBtn addTarget:self action:@selector(highScoreTap) forControlEvents:UIControlEventTouchUpInside];
        
        //UIImage *btnBackImage = [UIImage imageNamed:@"Icon_Back.png"];
        //[newGameBtn setImage:btnBackImage forState:UIControlStateNormal];
        highScoreBtn.autoresizingMask=(UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin);

        
        
        [self addSubview:newGameBtn];
        [self addSubview:highScoreBtn];
        
    }
    return self;
}

- (void) newGameTap {
    [[NotificationManager sharedInstance] postNotificationOnMainThreadName:GO_TO_GAME_VIEW object:nil userInfo:nil];
}

- (void) highScoreTap {
    [[NotificationManager sharedInstance] postNotificationOnMainThreadName:GO_TO_HIGHSCORE_VIEW object:nil userInfo:nil];
}

@end

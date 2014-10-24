//
//  GameView.h
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameViewDelegate <NSObject>

- (void) numberTap:(UIButton*)sender;

@end

@interface GameView : UIView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate totalNumber:(int) totalNumber;
-(void) dismissButtonWithID:(int)i isWinning:(BOOL)isWinning;
-(void)updateTimer:(double) timer;

- (void) resetViewWithSize:(int) size;
- (void) addMaskViewAndCoutingDown;


@end

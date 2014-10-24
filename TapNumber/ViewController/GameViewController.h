//
//  GameViewController.h
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"

@interface GameViewController : UIViewController <GameViewDelegate, UIAlertViewDelegate>

- (void) startCountingDown;
- (void) startGame;

@end

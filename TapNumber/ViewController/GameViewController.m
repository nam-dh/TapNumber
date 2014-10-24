//
//  GameViewController.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "TimerModel.h"
#import "MaskView.h"

#import "NotificationManager.h"

@interface GameViewController()
@property (assign, nonatomic) int size;
@property (assign, nonatomic) int currentNumber;
@property (strong, nonatomic) GameView* gameView;
@property (strong, nonatomic) NSTimer* timer;
@property (strong, nonatomic) TimerModel* timerModel;
@property (strong, nonatomic) MaskView* maskView;

@end

@implementation GameViewController


-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.size = 1;
        self.currentNumber = 0;
        self.gameView = [[GameView alloc]initWithFrame:self.view.bounds delegate:self totalNumber:self.size];
        self.view = self.gameView;
        self.timerModel = [[TimerModel alloc] init];
        
        [[NotificationManager sharedInstance] addObserver:self selector:@selector(startTiming) name:START_GAME_TIMING object:nil];
    
    }
    return self;
}

- (void) viewDidLoad {
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(startGame)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void) viewDidDisappear:(BOOL)animated {
   
    [self.timer invalidate];
    self.timer = nil;
    
    [self.timerModel setTimer:0];
    [self.gameView updateTimer:0];
    
}

- (void) numberTap:(UIButton*)sender{
    
    int tapNumber = (int) sender.tag;
    
    if (tapNumber == self.currentNumber + 1) {
        NSLog(@"Correct");
        self.currentNumber++;
        BOOL isWinning = NO;
        
        if (self.currentNumber == self.size * self.size) {
            NSLog(@"Win!");
            [self winGame];
            isWinning = YES;
            
        }
        [self.gameView dismissButtonWithID:tapNumber isWinning:isWinning];
    }
}

- (void) startCountingDown {
    [self.gameView addMaskViewAndCoutingDown];
}

- (void) startTiming {
    
    NSLog(@"Start TIMING");
    //NSDictionary *userInfo = [NSDictionary dictionaryWithObject:label.textColor  forKey:@"color"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)(0.01)
                                     target:self
                                   selector:@selector(updateTimer:)
                                   userInfo:nil
                                    repeats:TRUE];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void) winGame {
    if (self.timer.isValid) {
        [self.timer invalidate];
    }
    
    double endTime = [self.timerModel getTimer];
    NSLog(@"End Time = %.2f", endTime);
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"High Score" message:[NSString stringWithFormat:@"Your highscore: %fs.\nInput your name:",endTime]
                                                    delegate:self cancelButtonTitle:nil otherButtonTitles:@"Submit", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
}

-(void)updateTimer:(NSTimer*) theTimer{
    
    double timer = [self.timerModel getTimer] + 0.01;
    [self.gameView updateTimer:timer];
    [self.timerModel setTimer:timer];
}

- (void) startGame {
    NSLog(@"Start Game");
    
    [self.timer invalidate];
    self.timer = nil;
    
    [self.timerModel setTimer:0];
    [self.gameView updateTimer:0];
    
    [self.gameView resetViewWithSize:self.size];
    self.currentNumber = 0;
    
    [self startCountingDown];
    /*
    if (!self.timer.isValid) {
        [self startTiming];
    }
     */
}

@end

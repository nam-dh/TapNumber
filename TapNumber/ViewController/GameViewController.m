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

@interface GameViewController()
@property (assign, nonatomic) int size;
@property (assign, nonatomic) int currentNumber;
@property (strong, nonatomic) GameView* gameView;
@property (strong, nonatomic) NSTimer* timer;
@property (strong, nonatomic) TimerModel* timerModel;


@end

@implementation GameViewController


-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.size = 5;
        self.currentNumber = 0;
        self.gameView = [[GameView alloc]initWithFrame:self.view.bounds delegate:self totalNumber:self.size];
        self.view = self.gameView;
        self.timerModel = [[TimerModel alloc] init];
    }
    return self;
}


- (void) viewDidLoad {
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(restartGame)];
    self.navigationItem.rightBarButtonItem = anotherButton;
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

- (void) startGame {
    //NSDictionary *userInfo = [NSDictionary dictionaryWithObject:label.textColor  forKey:@"color"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)(0.01)
                                     target:self
                                   selector:@selector(updateTimer:)
                                   userInfo:nil
                                    repeats:TRUE];
}

- (void) winGame {
    [self.timer invalidate];
    
    double endTime = [self.timerModel getTimer];
    NSLog(@"End Time = %.2f", endTime);
}

-(void)updateTimer:(NSTimer*) theTimer{
    
    double timer = [self.timerModel getTimer] + 0.01;
    [self.gameView updateTimer:timer];
    [self.timerModel setTimer:timer];
}

- (void) restartGame {
    NSLog(@"Restart Game");
    [self.timerModel setTimer:0];
    [self.gameView resetViewWithSize:self.size];
    self.currentNumber = 0;
}

@end

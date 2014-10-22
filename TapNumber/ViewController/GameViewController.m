//
//  GameViewController.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"

@interface GameViewController()

@property (assign, nonatomic) int totalNumber;
@property (assign, nonatomic) int currentNumber;
@property (strong, nonatomic) GameView* gameView;

@end



@implementation GameViewController


-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.totalNumber = 30;
        self.currentNumber = 0;
        self.gameView = [[GameView alloc]initWithFrame:self.view.bounds delegate:self totalNumber:self.totalNumber];
        self.view = self.gameView;
        
    }
    return self;
}

- (void) numberTap:(UIButton*)sender{
    
    int tapNumber = (int) sender.tag;
    
    if (tapNumber == self.currentNumber + 1) {
        NSLog(@"Correct");
        
        [self.gameView dismissButtonWithID:tapNumber];
        self.currentNumber++;
        
    }
}


@end

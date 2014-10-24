//
//  NavigationController.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "NavigationController.h"
#import "GameViewController.h"
#import "TopViewController.h"

#import "NotificationManager.h"

@interface NavigationController()

@property (retain, nonatomic) GameViewController *gameViewController;
@property (retain, nonatomic) TopViewController *homeViewController;

@end

@implementation NavigationController

- (id) init
{
    self = [super init];
    if (self) {
    
        self.homeViewController = [[TopViewController alloc] init];
        self.gameViewController = [[GameViewController alloc] init];
        
        [self pushViewController:self.homeViewController animated:NO];
        
        [[NotificationManager sharedInstance] addObserver:self selector:@selector(newGameTap:) name:GO_TO_GAME_VIEW object:nil];
    }
    
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (void) newGameTap:(NSNotification *)notification
{
    [self pushViewController:self.gameViewController animated:YES];
    [self.gameViewController startGame];
}


@end

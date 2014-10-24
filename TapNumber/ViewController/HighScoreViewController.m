//
//  HighScoreViewController.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreViewController.h"
#import "HighScoreView.h"
#import "HighScoreModel.h"
#import "StorageManager.h"

@interface HighScoreViewController ()

@property (strong, nonatomic) HighScoreView *highScoreView;
@property (strong, nonatomic) NSMutableArray* highScoreArray;

@end

@implementation HighScoreViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.highScoreView = [[HighScoreView alloc] initWithFrame:self.view.bounds];
        self.view = self.highScoreView;
        
        self.highScoreArray = [[StorageManager sharedInstance] objectForKey:HIGH_SCORE_LIST];
        
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end

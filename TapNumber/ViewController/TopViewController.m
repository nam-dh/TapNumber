//
//  TopViewController.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "TopViewController.h"
#import "GameViewController.h"
#import "TopView.h"

@interface TopViewController ()

@property (strong, nonatomic) GameViewController* gameViewController;

@end

@implementation TopViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        TopView* topView = [[TopView alloc]initWithFrame:self.view.bounds delegate:self];
        self.view = topView;
        
        
        self.gameViewController = [[GameViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) newGameTap
{
    [self presentViewController:self.gameViewController animated:YES completion:nil];
}

@end

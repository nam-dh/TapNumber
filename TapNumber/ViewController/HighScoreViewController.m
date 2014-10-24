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
#import "HighScoreList.h"
#import "NotificationManager.h"

#import "StorageManager.h"

@interface HighScoreViewController ()

@property (strong, nonatomic) HighScoreView *highScoreView;
@property (strong, nonatomic) HighScoreList* highScoreArray;

@end

@implementation HighScoreViewController

double tempScore;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.highScoreView = [[HighScoreView alloc] initWithFrame:self.view.bounds delegate:self];
        self.view = self.highScoreView;
        
        self.highScoreArray = [[HighScoreList alloc] init];
        
        [[NotificationManager sharedInstance] addObserver:self selector:@selector(checkScoreInHighScore:) name:WIN_WITH_SCORE object:nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    return [[self.highScoreArray getList] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セルにテキストを設定
    // セルの内容はNSArray型の「items」にセットされているものとする
    HighScoreModel *model = [[self.highScoreArray getList] objectAtIndex:indexPath.row];
    if (model) {
        NSLog(@"Name = %@", [model getName]);
        NSLog(@"Score = %.2f", [model getHighScore]);
    
        NSString *cellText = [NSString stringWithFormat:@"%@\t\t%.2f", [model getName], [model getHighScore]];
        cell.textLabel.text = cellText;
    }
    
    return cell;
    
}

- (void) checkScoreInHighScore:(NSNotification*)notification {
    
    NSNumber *score = notification.object;
    tempScore = score.doubleValue;
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"High Score" message:[NSString stringWithFormat:@"Your highscore: %fs.\nInput your name:",tempScore]
                                                    delegate:self cancelButtonTitle:nil otherButtonTitles:@"Submit", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *name = [[alertView textFieldAtIndex:0] text];
    
    HighScoreModel *model = [[HighScoreModel alloc] initWithName:name withScore:tempScore];
    
    [self.highScoreArray addObject:model];
}

@end

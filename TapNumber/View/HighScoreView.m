//
//  HighScoreView.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreView.h"

@interface HighScoreView()

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation HighScoreView

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect labelFrame = CGRectMake(0, 100, frame.size.width, 40);
        UILabel *highScoreLabel = [[UILabel alloc] initWithFrame:labelFrame];
        [highScoreLabel setTextAlignment:NSTextAlignmentCenter];
        [highScoreLabel setText:@"HIGH SCORE"];
        
        [self addSubview:highScoreLabel];
        
        
        CGRect tableFrame = CGRectMake(20, 170, frame.size.width - 40, frame.size.height - 210);
        self.tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
        self.tableView.scrollEnabled = NO;
        self.tableView.userInteractionEnabled = NO;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.tableView.rowHeight = 30;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView reloadData];
        
        [self addSubview:self.tableView];
        
    }
    return self;
}

- (void) reloadData
{
    [self.tableView reloadData];
}

@end

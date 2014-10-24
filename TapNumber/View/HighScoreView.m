//
//  HighScoreView.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreView.h"

@implementation HighScoreView

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect labelFrame = CGRectMake(0, 150, frame.size.width, 20);
        UILabel *highScoreLabel = [[UILabel alloc] initWithFrame:labelFrame];
        [highScoreLabel setTextAlignment:NSTextAlignmentCenter];
        [highScoreLabel setText:@"HIGH SCORE"];
        
        [self addSubview:highScoreLabel];
        
        
        CGRect tableFrame = CGRectMake(20, 170, frame.size.width - 40, frame.size.height - 170);
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableView.delegate = delegate;
        tableView.dataSource = delegate;
        [tableView reloadData];
        
        [self addSubview:tableView];
        
    }
    return self;
}

@end

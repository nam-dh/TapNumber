//
//  HighScoreTableCell.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreTableCell.h"

@interface HighScoreTableCell()

@property (strong, nonatomic) UILabel* nameLabel;
@property (strong, nonatomic) UILabel* scoreLabel;
@property (strong, nonatomic) UILabel* rankingLabel;

@end

@implementation HighScoreTableCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.rankingLabel = [[UILabel alloc] init];
        self.nameLabel = [[UILabel alloc] init];
        self.scoreLabel = [[UILabel alloc] init];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.scoreLabel];
        [self addSubview:self.rankingLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat height = 30;
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat paddingTop = self.bounds.size.height - 30;
    CGFloat paddingLeft = 10;
    
    self.rankingLabel.frame = CGRectMake(paddingLeft, paddingTop, fullWidth* 0.2, height);
    
    paddingLeft = paddingLeft + self.rankingLabel.frame.size.width;
    self.nameLabel.frame = CGRectMake(paddingLeft, paddingTop, fullWidth* 0.7 - paddingLeft, height);
    
    paddingLeft = paddingLeft + self.nameLabel.frame.size.width;
    self.scoreLabel.frame = CGRectMake(paddingLeft, paddingTop, fullWidth* 0.3, height);
}

- (void) setName:(NSString*) name andScore:(double) score andRanking:(short) ranking{
    
    self.nameLabel.text = name;
    self.scoreLabel.text = [NSString stringWithFormat:@"%.2f", score];
    
    if (ranking < 10) {
        self.rankingLabel.text = [NSString stringWithFormat:@" %d.", ranking];
    } else {
        self.rankingLabel.text = [NSString stringWithFormat:@"%d.", ranking];
    }
}


@end

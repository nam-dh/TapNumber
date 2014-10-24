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

@end

@implementation HighScoreTableCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.nameLabel = [[UILabel alloc] init];
        self.scoreLabel = [[UILabel alloc] init];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.scoreLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat height = 30;
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat paddingTop = self.bounds.size.height - 30;
    
    self.nameLabel.frame = CGRectMake(10, paddingTop, fullWidth* 0.5 - 10, height);
    self.scoreLabel.frame = CGRectMake(fullWidth*0.5, paddingTop, fullWidth* 0.5, height);
}

- (void) setName:(NSString*) name andScore:(double) score {
    
    self.nameLabel.text = name;
    self.scoreLabel.text = [NSString stringWithFormat:@"%.2f", score];
}


@end

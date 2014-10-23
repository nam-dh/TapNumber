//
//  GameView.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "GameView.h"
#include <stdlib.h>
#include <math.h>

@interface GameView()
@property (strong, nonatomic) id<GameViewDelegate> delegate;

@property (strong, nonatomic) UIView *gameBaseView;
@property (strong, nonatomic) UILabel *timerLabel;
@property (strong, nonatomic) UILabel *waitingNumber;

@end

@implementation GameView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate totalNumber:(int) totalNumber
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"gameview");
        self.backgroundColor = [UIColor grayColor];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.waitingNumber = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth* 0.2, screenHeight* 0.15, screenHeight*0.15, screenHeight*0.15)];
        [self.waitingNumber setText:@"1"];
        [self addSubview:self.waitingNumber];
        
        self.timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth* 0.75, screenHeight* 0.15, screenHeight*0.15, screenHeight*0.15)];
        [self.timerLabel setText:@"0.00"];
        [self addSubview:self.timerLabel];

        CGFloat paddingWidth = 10;
        CGFloat paddingHeight = screenHeight * 0.3;
        
        CGRect gameBaseFrame = CGRectMake(paddingWidth, paddingHeight, screenWidth - 2*paddingWidth, screenWidth - 2*paddingWidth);
        self.gameBaseView = [[UIView alloc] initWithFrame:gameBaseFrame];
        [self addSubview:self.gameBaseView];
        
        [self initGameMatrixViewWithSize:totalNumber inFrame:gameBaseFrame];
        
    }
    return self;
}



- (void) initGameMatrixViewWithSize:(int)size inFrame:(CGRect) frame {
    
    
    CGFloat buttonSize = frame.size.width / size;
    
    NSMutableArray *numberArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < size*size; i ++) {
        [numberArray addObject:[NSNumber numberWithInt:(i+1)]];
    }
    
    for (int i = 0; i < size*size; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"New game" forState:UIControlStateNormal];
        
        CGFloat x = fmod(i, size)*(buttonSize);
        CGFloat y = (i/size) * (buttonSize);
        
        
        btn.frame = CGRectMake(x, y, buttonSize, buttonSize);
        [btn addTarget:self.delegate action:@selector(numberTap:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *image = [UIImage imageNamed:@"ruby.png"];
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        btn.autoresizingMask=(UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin);
        
        int r = arc4random_uniform((u_int32_t)numberArray.count);
        NSNumber *number = [numberArray objectAtIndex:r];
        
        btn.tag = [number intValue];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //btn.titleLabel.numberOfLines = 1;
        btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btn.titleLabel sizeToFit];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
        //[btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 50.0, 0.0)];
        //[btn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
        
        [btn setTitle:[NSString stringWithFormat:@"%d",[number intValue]] forState:UIControlStateNormal];
        [numberArray removeObjectAtIndex:r];
        
        [self.gameBaseView addSubview:btn];
    }
    
}

- (void) dismissButtonWithID:(int)i isWinning:(BOOL)isWinning
{
    for (UIButton *btn in self.gameBaseView.subviews) {
        if (btn.tag == i){
            btn.alpha = 0.3;
            btn.enabled = NO;
            //[btn removeFromSuperview];
        }
    }
    if (!isWinning) {
        self.waitingNumber.text = [NSString stringWithFormat:@"%d", i+1];
    } else {
       self.waitingNumber.text = @"WIN";
    }

}


-(void)updateTimer:(double) timer{
    
    NSString * timerString = [NSString stringWithFormat:@"%.2f",timer];
    [self.timerLabel setText:timerString];
}

@end

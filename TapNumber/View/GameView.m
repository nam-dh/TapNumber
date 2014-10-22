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
@property (strong, nonatomic) NSMutableArray *buttonArray;

@property (strong, nonatomic) UIView *gameBaseView;

@end

@implementation GameView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate totalNumber:(int) totalNumber
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"gameview");
        self.backgroundColor = [UIColor grayColor];
        
        CGRect gameBaseFrame = CGRectMake(20, 50, 400, 400);
        self.gameBaseView = [[UIView alloc] initWithFrame:gameBaseFrame];
        [self addSubview:self.gameBaseView];
        
        [self initGameMatrixViewWithSize:totalNumber inFrame:frame];
        self.buttonArray = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void) initGameMatrixViewWithSize:(int)size inFrame:(CGRect) frame {
    
    
    CGFloat buttonWidth = 50;
    CGFloat buttonHeight = 50;
    
    NSMutableArray *numberArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < size; i ++) {
        [numberArray addObject:[NSNumber numberWithInt:(i+1)]];
    }
    
    for (int i = 0; i < size; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"New game" forState:UIControlStateNormal];
        
        CGFloat x = 20+ fmod(i, 5)*(buttonWidth + 2);
        CGFloat y = 50+ (i/5) * (buttonHeight + 2);
        
        
        btn.frame = CGRectMake(x, y, buttonWidth, buttonHeight);
        [btn addTarget:self.delegate action:@selector(numberTap:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *image = [UIImage imageNamed:@"ruby.png"];
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        btn.autoresizingMask=(UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin);
        
        int r = arc4random_uniform((u_int32_t)numberArray.count);
        NSNumber *number = [numberArray objectAtIndex:r];
        
        btn.tag = [number intValue];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 50.0, 0.0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
        
        [btn setTitle:[NSString stringWithFormat:@"%d",[number intValue]] forState:UIControlStateNormal];
        [numberArray removeObjectAtIndex:r];
        
        [self.gameBaseView addSubview:btn];
    }
    
}

- (void) dismissButtonWithID:(int)i
{
    for (UIButton *btn in self.gameBaseView.subviews) {
        if (btn.tag == i){
            [btn removeFromSuperview];
        }
    }
}

@end

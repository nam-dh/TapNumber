//
//  MaskView.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "MaskView.h"
#import "NotificationManager.h"
#import <QuartzCore/QuartzCore.h>

@interface MaskView()

@property (nonatomic, strong) UILabel* coutingNumber;
@property (nonatomic, assign) int number;

@end


@implementation MaskView

int maxNumber = 3;

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate withAlpha:(CGFloat) alpha
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:alpha]];
        self.number = maxNumber;
        
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        CGFloat numberSize = frame.size.height *0.5;
        CGRect numberFrame = CGRectMake(((frame.size.width - numberSize)*0.5), ((frame.size.height - numberSize)*0.5), numberSize, numberSize);
        self.coutingNumber = [[UILabel alloc] initWithFrame:numberFrame];
        [self.coutingNumber setText:[NSString stringWithFormat:@"%d", self.number]];

        
        [self.coutingNumber setFont:[UIFont systemFontOfSize:150]];
        [self.coutingNumber setTextColor:[UIColor whiteColor]];
        self.coutingNumber.adjustsFontSizeToFitWidth = YES;
        [self.coutingNumber setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:self.coutingNumber];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) startAnimation {
    
    NSLog(@"Start animation");
    [self.coutingNumber setText:[NSString stringWithFormat:@"%d", self.number]];
    self.coutingNumber.transform = CGAffineTransformIdentity;
    self.coutingNumber.alpha = 1;
    self.coutingNumber.hidden = NO;
    
    if (self.number <= maxNumber) {
        
        [UIView animateWithDuration:1.0f delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^
         {
             self.coutingNumber.alpha = 0;
             self.coutingNumber.transform = CGAffineTransformScale(self.coutingNumber.transform, 0.2, 0.2);
             self.number--;
         }
                         completion:^(BOOL finished) {
                             
                             if (self.number > 0) {
                                 
                                 [self startAnimation];
                             } else {
                                 if (self.superview) {
                                     self.coutingNumber.hidden = YES;
                                     [UIView animateWithDuration:0.15
                                                      animations:^{self.alpha = 0.0;}
                                                      completion:^(BOOL finished){
                                                          [self removeFromSuperview];
                                                          self.coutingNumber.transform = CGAffineTransformIdentity;
                                                          self.coutingNumber.alpha = 1;
                                                          
                                                          [[NotificationManager sharedInstance] postNotificationOnMainThreadName:START_GAME_TIMING object:nil userInfo:nil];
                                                      }];
                                 }
                             }
                         }];

        
    }
    
    
}

- (void) restartNumber {
    self.number = maxNumber;
}

@end

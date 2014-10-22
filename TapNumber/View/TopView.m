//
//  TopView.m
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "TopView.h"

@interface TopView()

@property (strong, nonatomic) id<TopViewDelegate> delegate;

@end

@implementation TopView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"topview");
        self.delegate = delegate;
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat buttonWidth = frame.size.width /3;
        CGFloat buttonHeight = frame.size.height /5;
        
        UIButton *newGameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [newGameBtn setTitle:@"New game" forState:UIControlStateNormal];
        newGameBtn.frame = CGRectMake(frame.size.width/3, frame.size.height *0.4, buttonWidth, buttonHeight);
        [newGameBtn addTarget:delegate action:@selector(newGameTap) forControlEvents:UIControlEventTouchUpInside];
        
        //UIImage *btnBackImage = [UIImage imageNamed:@"Icon_Back.png"];
        //[newGameBtn setImage:btnBackImage forState:UIControlStateNormal];
        newGameBtn.autoresizingMask=(UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin);
        //newGameBtn.hidden = YES;
        [self addSubview:newGameBtn];
        
    }
    return self;
    
}

@end

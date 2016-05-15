//
//  messageDisplay.m
//  Board Share
//
//  Created by Rohan Thomare on 3/3/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

#import "MessageDisplay.h"

#define VERTICAL_SPACING 8.0f
#define HORIZONTAL_SPACING 16.0f
#define LIVE_DURATION 1.0f

@interface MessageDisplay()

@property (nonatomic, strong) UILabel* messageLabel;
@property CGFloat liveDuration;

@end

@implementation MessageDisplay

+(MessageDisplay*)messageDisplayWithText:(NSString *)messageStr withAutoRemoval:(BOOL)autoRemoval{
    id messageView = [[[NSBundle mainBundle] loadNibNamed:@"MessageDisplay" owner:self options:nil] objectAtIndex:0];
    
    if([messageView isKindOfClass:[MessageDisplay class]])
    {
        MessageDisplay* message = (MessageDisplay*)messageView;
        [message setText:messageStr withAutoRemoval:autoRemoval];
    }
    return (MessageDisplay*)messageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    CGRect rect = CGRectMake(HORIZONTAL_SPACING, VERTICAL_SPACING, self.frame.size.width-(HORIZONTAL_SPACING*2), self.frame.size.height-(VERTICAL_SPACING*2));
    
    self.messageLabel = [[UILabel alloc] initWithFrame:rect];
    self.messageLabel.textColor = [UIColor whiteColor];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:self.messageLabel];
    
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [[UIColor alloc] initWithWhite:0.0 alpha:.5];
}

-(void)setText:(NSString*)messageStr withAutoRemoval:(BOOL)autoRemoval
{
    self.messageLabel.text = messageStr;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:self.messageLabel.font, NSFontAttributeName, self.messageLabel.textColor, NSForegroundColorAttributeName, self.messageLabel.backgroundColor, NSBackgroundColorAttributeName, nil];

    CGSize labelRect = [messageStr sizeWithAttributes:attributes];
    
    CGPoint center = self.center;
    
    CGRect frame = self.frame;
    frame.size.width = labelRect.width+(HORIZONTAL_SPACING*2);
    frame.size.height = labelRect.height+(VERTICAL_SPACING*2);
    [self setFrame:frame];
    [self setCenter:center];
    
    self.layer.cornerRadius = frame.size.height/2;
    
    self.messageLabel.frame = CGRectMake(HORIZONTAL_SPACING,VERTICAL_SPACING,labelRect.width,labelRect.height);
    
    if(autoRemoval)
    {
        [NSTimer scheduledTimerWithTimeInterval:LIVE_DURATION target: self
                                       selector: @selector(hideAndRemoveMessage) userInfo: nil repeats: NO];
    }
    
    
}

-(void)hideAndRemoveMessage
{
    [self animateRemovalwithDelay:0.0f andDuration:2.0f];
}

-(void)animateRemovalwithDelay:(NSTimeInterval)delay andDuration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^
    {
        self.alpha = 0.0f;
    }
    completion:^(BOOL completed)
    {
        [self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

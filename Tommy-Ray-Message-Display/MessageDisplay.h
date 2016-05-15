//
//  messageDisplay.h
//  Board Share
//
//  Created by Rohan Thomare on 3/3/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageDisplay : UIView

+(MessageDisplay*)messageDisplayWithText:(NSString*)messageStr withAutoRemoval:(BOOL)autoRemoval;

-(void)hideAndRemoveMessage;

-(void)setText:(NSString*)messageStr withAutoRemoval:(BOOL)autoRemoval;

@end


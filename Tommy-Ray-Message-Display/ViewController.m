//
//  ViewController.m
//  Tommy-Ray-Message-Display
//
//  Created by Rohan Thomare on 10/5/14.
//  Copyright (c) 2014 TommyRayStudios. All rights reserved.
//
#import "MessageDisplay.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MessageDisplay* message = [MessageDisplay messageDisplayWithText:@"Tommy Ray Message Text" withAutoRemoval:YES];
    
    message.center = self.view.center;
    [self.view addSubview:message];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

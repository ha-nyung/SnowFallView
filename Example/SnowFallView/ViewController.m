//
//  ViewController.m
//  SnowFallView
//
//  Created by Josh Ha-Nyung Chung on 01/21/2016.
//  Copyright (c) 2016 Josh Ha-Nyung Chung. All rights reserved.
//

#import "ViewController.h"

#import <SnowFallView/SnowFallView.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SnowFallView *snowFallView;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [self.snowFallView start];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.snowFallView stop];
}

@end

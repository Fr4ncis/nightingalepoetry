//
//  PoemListenViewController.m
//  Nightingale
//
//  Created by Ana Catarina Figueiredo on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "PoemListenViewController.h"
#import "CBAutoScrollLabel.h"

@interface PoemListenViewController ()
@property (nonatomic, strong) IBOutlet CBAutoScrollLabel *label;
@property (nonatomic, copy) NSString *bigString;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation PoemListenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.bigString = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play
{
    self.label.text = self.bigString;
    self.label.textColor = [UIColor blackColor];
    self.label.labelSpacing = 35; // distance between start and end labels
    self.label.pauseInterval = 3.7; // seconds of pause before scrolling starts again
    self.label.scrollSpeed = 30; // pixels per second
    self.label.textAlignment = UITextAlignmentCenter; // centers text when no auto-scrolling is applied
    self.label.fadeLength = 12.f; // length of the left and right edge fade, 0 to disable
    self.label.scrollDirection = CBAutoScrollDirectionLeft;
    [self.label observeApplicationNotifications];
}

@end

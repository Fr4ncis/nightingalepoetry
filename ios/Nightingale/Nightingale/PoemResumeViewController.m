//
//  PoemResumeViewController.m
//  Nightingale
//
//  Created by Ana Catarina Figueiredo on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "PoemResumeViewController.h"
#import "PoemReadViewController.h"
#import "PoemListenViewController.h"

@interface PoemResumeViewController ()
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@end

@implementation PoemResumeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1127);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aboutPoem
{
    [self.scrollView scrollRectToVisible:self.imageView.frame animated:YES];
}

- (IBAction)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)read
{
    [self.delegate didSelectRead];
}

- (IBAction)listen
{
    [self.delegate didSelectListen];
}

@end

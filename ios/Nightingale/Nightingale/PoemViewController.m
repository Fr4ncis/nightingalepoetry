//
//  PoemViewController.m
//  Nightingale
//
//  Created by Ana Catarina Figueiredo on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "PoemViewController.h"
#import "PoemReadViewController.h"
#import "PoemListenViewController.h"
#import "PoemResumeViewController.h"

@interface PoemViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, PoemResumeViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) PoemListenViewController *listenViewController;
@property (nonatomic, strong) PoemReadViewController *readViewController;
@property (nonatomic, strong) PoemResumeViewController *resumViewController;
@end

@implementation PoemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    [[self.pageViewController view] setFrame:[[self view] bounds]];
    
    self.listenViewController = [[PoemListenViewController alloc] init];
    self.readViewController = [[PoemReadViewController alloc] init];
    self.resumViewController = [[PoemResumeViewController alloc] init];
    self.resumViewController.delegate = self;
    
    NSArray *viewControllers = @[self.resumViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [[self view] addSubview:[self.pageViewController view]];
    [self.pageViewController didMoveToParentViewController:self];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    if (viewController.class == [PoemResumeViewController class])
    {
        return self.readViewController;
    }
    
    if (viewController.class == [PoemReadViewController class])
    {
        return nil;
    }

    if (viewController.class == [PoemListenViewController class])
    {
        return self.resumViewController;
    }
    
    return nil;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if (viewController.class == [PoemResumeViewController class])
    {
        return self.listenViewController;
    }
    
    if (viewController.class == [PoemReadViewController class])
    {
        return self.resumViewController;
    }
    
    if (viewController.class == [PoemListenViewController class])
    {
        return nil;
    }
    
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

- (void)didSelectListen
{
    [self.pageViewController setViewControllers:@[self.listenViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didSelectRead
{
    [self.pageViewController setViewControllers:@[self.readViewController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

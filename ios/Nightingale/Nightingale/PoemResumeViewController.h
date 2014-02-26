//
//  PoemResumeViewController.h
//  Nightingale
//
//  Created by Ana Catarina Figueiredo on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PoemResumeViewControllerDelegate <NSObject>

- (void)didSelectRead;
- (void)didSelectListen;

@end

@interface PoemResumeViewController : UIViewController
@property (nonatomic, weak) id <PoemResumeViewControllerDelegate>delegate;
@end

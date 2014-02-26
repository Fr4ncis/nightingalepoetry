//
//  DiscoveredPoemAnnotationView.m
//  Nightingale
//
//  Created by Francesco Mattia on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "DiscoveredPoemAnnotationView.h"

@implementation DiscoveredPoemAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier])
    {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.clipsToBounds = NO;
    self.frame = CGRectMake(0, 0, 80, 80);
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pinLocationWhite"]];
    [self addSubview:imageView];
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

//
//  PoemAnnotation.h
//  Nightingale
//
//  Created by Francesco Mattia on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface PoemAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

//
//  MapLocationsViewController.m
//  Nightingale
//
//  Created by Francesco Mattia on 26/02/2014.
//  Copyright (c) 2014 AKQA. All rights reserved.
//

#import "MapLocationsViewController.h"
#import "PoemAnnotation.h"
#import "DiscoveredPoemAnnotation.h"
#import "PoemAnnotationView.h"
#import "DiscoveredPoemAnnotationView.h"

@interface MapLocationsViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapLocationsViewController

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
    CLLocationCoordinate2D locationCoor = CLLocationCoordinate2DMake(51.521008, -0.105025);
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(locationCoor, 4000, 4000)];
    
    CLLocationCoordinate2D stPaulCoord = CLLocationCoordinate2DMake(51.513837, -0.099006);
    PoemAnnotation *pAnnotation = [PoemAnnotation new];
    pAnnotation.coordinate = stPaulCoord;
    [self.mapView addAnnotation:pAnnotation];

    CLLocationCoordinate2D angelCoord = CLLocationCoordinate2DMake(51.532428, -0.10613);
    DiscoveredPoemAnnotation *dAnnotation = [DiscoveredPoemAnnotation new];
    dAnnotation.coordinate = angelCoord;
    [self.mapView addAnnotation:dAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[PoemAnnotation class]])
    {
        PoemAnnotationView *annotationView = (PoemAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
        if (!annotationView)
        {
            annotationView = [[PoemAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
        }
        return annotationView;
    }
    else
    {
        DiscoveredPoemAnnotationView *annotationView = (DiscoveredPoemAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
        if (!annotationView)
        {
            annotationView = [[DiscoveredPoemAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
        }
        return annotationView;
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    [mapView deselectAnnotation:view.annotation animated:NO];
    NSLog(@"annotation %@", view.annotation);
}

@end

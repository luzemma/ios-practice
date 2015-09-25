//
//  LakeMapViewController.m
//  GoogleMapCodeSchool
//
//  Created by Luzemma Gonzalez on 10/04/14.
//  Copyright (c) 2014 Luzemma Gonzalez. All rights reserved.
//

#import "LakeMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface LakeMapViewController ()

@property (strong, nonatomic) GMSMapView *mapView;

@end

@implementation LakeMapViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    GMSCameraPosition *camera =[GMSCameraPosition cameraWithLatitude:19.377904
                                                           longitude:-99.177450
                                                                zoom:14
                                                             bearing:0
                                                        viewingAngle:0];
    self.mapView = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    self.mapView.mapType = kGMSTypeTerrain;
    self.mapView.myLocationEnabled = YES;
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.myLocationButton = YES;
    [self.mapView setMinZoom:10 maxZoom:18];
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1.position = CLLocationCoordinate2DMake(19.379089, -99.179009);
    marker1.title = @"Restaurante Daruma";
    marker1.snippet = @"Conoce nuestros deliciiosos Sakes";
    marker1.appearAnimation = kGMSMarkerAnimationPop;
    marker1.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    marker1.map = self.mapView;
    
    [self.view addSubview:self.mapView];
}


-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.mapView.padding = UIEdgeInsetsMake(self.topLayoutGuide.length + 5, 0, self.bottomLayoutGuide.length + 5, 0);
}

//-(BOOL) prefersStatusBarHidden{
//    return YES;
//}

@end

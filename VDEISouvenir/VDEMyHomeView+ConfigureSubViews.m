//
//  VDEMyHomeView+ConfigureSubViews.m
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeView+ConfigureSubViews.h"
#import "VDEMyHomeViewController.h"
#import "VDEMyHomeViewController+HandleSubViewsActions.h"
#import "VDEMyHomeView.h"
#import "VDEMyAnnotation.h"
#import "VDEMyHomeViewController+DelegateActions.h"

@implementation VDEMyHomeView (ConfigureSubViews)

-(void) configureSubviews {
  //--------------------------------------------------------------------------------------------------------
  
  self.theBlueSatellite = [UIImage imageNamed:@"satelliteBlue.png"];
  self.theGreySatellite = [UIImage imageNamed:@"satelliteGrey.png"];
  self.theBlueMap       = [UIImage imageNamed:@"mapBlue.png"];
  self.theGreyMap       = [UIImage imageNamed:@"mapGrey.png"];
  
  
#pragma mark TheButtons
  //--------------------------------------------------------------------------------------------------------
  
  /*
  theContactButton    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                      target:self.theViewController
                                                                      action:@selector(associateContact)];
  */
  thePinButton        = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                      target:self.theViewController
                                                                      action:@selector(addPinToMap)];
  
  self.theHomeButton       = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                       target:self.theViewController
                                                                       action:@selector(goToCurrentLocation)];
  
  theFlexibleSpaceBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                      target:nil
                                                                      action:@selector(alloc)];
  
  theFixedSpaceBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                      target:nil
                                                                      action:@selector(alloc)];
  [theFixedSpaceBar setWidth:2];
  
  theClearMapButton    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                      target:self.theViewController
                                                                      action:@selector(clearMap)];
  
  
  
  // map style button
  UIButton *temp_button_map = [UIButton buttonWithType:UIButtonTypeCustom];
  [temp_button_map setFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
  [temp_button_map addTarget:self.theViewController action:@selector(activateMapView) forControlEvents:UIControlEventTouchUpInside];
  [temp_button_map setImage:self.theBlueMap forState:UIControlStateNormal];
  [temp_button_map setImage:self.theGreyMap forState:UIControlStateDisabled];
  
  self.theMapButton= [[UIBarButtonItem alloc] initWithCustomView:temp_button_map] ;
  [self.theMapButton setEnabled:NO];
  
  // satellite style button
  UIButton *temp_button_satellite = [UIButton buttonWithType:UIButtonTypeCustom];
  [temp_button_satellite setFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
  [temp_button_satellite addTarget:self.theViewController action:@selector(activateSatelliteView) forControlEvents: UIControlEventTouchUpInside];
  [temp_button_satellite setImage:self.theBlueSatellite forState:UIControlStateNormal];
  [temp_button_satellite setImage:self.theGreySatellite forState:UIControlStateDisabled];
  
  self.theSatelitteButton = [[UIBarButtonItem alloc] initWithCustomView:temp_button_satellite];
  [self.theSatelitteButton setEnabled:YES];
  


  
  NSArray *theTools =@[theFixedSpaceBar,
                       self.theHomeButton,
                       theFlexibleSpaceBar,
                       thePinButton,
                       theFlexibleSpaceBar,
                       self.theMapButton,
                       theFlexibleSpaceBar,
                       self.theSatelitteButton,
                       theFlexibleSpaceBar,
                       theClearMapButton,
                       theFixedSpaceBar];

  
  
#pragma mark theMapView
//--------------------------------------------------------------------------------------------------------
  
  self.theMap = [[MKMapView alloc]init];
  [self.theMap setScrollEnabled:YES];
  [self.theMap setZoomEnabled:YES];
  self.theMap.mapType =MKMapTypeStandard;

  [self addSubview:self.theMap];
  
  self.theMap.delegate = self.theViewController;
  
  
  
#pragma mark theToolbar
  //--------------------------------------------------------------------------------------------------------
  // The toolbar on second position in order to have it on top of the mapView
  theToolBar = [[UIToolbar alloc] init];
  [theToolBar setItems:theTools];
  [theToolBar setBarStyle:UIBarStyleBlackTranslucent];

  [self addSubview:theToolBar];
 

#pragma mark theStatusbarOverlay
//--------------------------------------------------------------------------------------------------------

  theStatusBarOverlay = [[UIView alloc] init];
  [theStatusBarOverlay setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9  alpha:0.7]];
  [self addSubview:theStatusBarOverlay];
  
#pragma mark theLocationManager
//--------------------------------------------------------------------------------------------------------
  
  
  self.theLocationManager = [[CLLocationManager alloc]init];
  self.theLocationManager.distanceFilter = 1.0;
  self.theLocationManager.delegate = self.theViewController;
  
  }

@end

//
//  VDEMyView.h
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/Corelocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <AddressBookUI/AddressBookUI.h>
#import "VDEMyHomeView.h"



@class VDEMyHomeViewController;


@interface VDEMyHomeView : UIView  {
  
  UIToolbar       *theToolBar;
  
  UIBarButtonItem *theContactButton;
  UIBarButtonItem *thePinButton;
  UIBarButtonItem *theFlexibleSpaceBar;
  UIBarButtonItem *theFixedSpaceBar;

  UIBarButtonItem *theClearMapButton;

  UIView *theStatusBarOverlay;
    
}

@property (nonatomic,strong)  VDEMyHomeViewController *theViewController;
@property (nonatomic,strong)  MKMapView               *theMap;

@property (nonatomic,strong)  UIBarButtonItem         *theSatelitteButton;
@property (nonatomic,strong)  UIBarButtonItem         *theMapButton;
@property (nonatomic,strong)  UIBarButtonItem         *theHomeButton;
@property (nonatomic,strong)  UIImage                 *theBlueSatellite;
@property (nonatomic,strong)  UIImage                 *theGreySatellite;
@property (nonatomic,strong)  UIImage                 *theBlueMap;
@property (nonatomic,strong)  UIImage                 *theGreyMap;

@property (nonatomic,strong)  UIBarButtonItem         *theTestButton;

@property (nonatomic,strong)  CLLocationManager       *theLocationManager;

@property (nonatomic,strong)  ABPeoplePickerNavigationController *theAddressBookNavigationController;


@end


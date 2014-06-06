//
//  VDEMyHomeViewController+HandleSubViewsActions.m
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeViewController+HandleSubViewsActions.h"
#import "VDEMyAnnotation.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import "VDEMyHomeViewController+DelegateActions.h"



@implementation VDEMyHomeViewController (HandleSubViewsActions)


-(void) associateContact:(MKAnnotationView*) selectedAnnotation {
//--------------------------------------------------------------------------------------------------------
  
  NSLog(@"Associate contact");
  self.selectedAnnotation = selectedAnnotation;
  
  theHomeView.theAddressBookNavigationController = [[ABPeoplePickerNavigationController alloc] init];
  [theHomeView.theAddressBookNavigationController setPeoplePickerDelegate:self];
  NSArray *theListOfContacts = [NSArray arrayWithObjects:[NSNumber numberWithInt: kABPersonPhoneProperty],nil];
  [theHomeView.theAddressBookNavigationController setDisplayedProperties:theListOfContacts];
  
  
  if(self.isIPhone) {
    [self presentViewController:theHomeView.theAddressBookNavigationController animated:YES completion:nil];
  } else {
   self.thePopOverController = [[UIPopoverController alloc] initWithContentViewController:theHomeView.theAddressBookNavigationController];
    
    //((self.selectedAnnotation).frame : to get the CGRect associated with the object ... thanks StackOverflow
    
    [self.thePopOverController presentPopoverFromRect:(self.selectedAnnotation).frame inView:theHomeView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

  }
}

-(void) addPinToMap {
//--------------------------------------------------------------------------------------------------------
  NSLog(@"Add pin");

  VDEMyAnnotation *theNewAnnotation = [[VDEMyAnnotation alloc] init];
  [theNewAnnotation setTitle: [NSString stringWithFormat:@"Pas de contact associé..."]];
  [theNewAnnotation setCoordinate: theHomeView.theMap.centerCoordinate];
  [theHomeView.theMap addAnnotation:theNewAnnotation];

}

-(void) activateMapView {
//--------------------------------------------------------------------------------------------------------
  
  theHomeView.theMap.mapType = MKMapTypeStandard;
  [theHomeView.theMapButton setEnabled:NO];
  [theHomeView.theSatelitteButton setEnabled:YES];
 
}

-(void) activateSatelliteView {
//--------------------------------------------------------------------------------------------------------

  theHomeView.theMap.mapType = MKMapTypeHybrid;
  
  [theHomeView.theSatelitteButton setEnabled:NO];
  [theHomeView.theMapButton setEnabled:YES];

}

-(void) goToCurrentLocation {
//--------------------------------------------------------------------------------------------------------

  NSLog(@"Go to current location");
  
  if ( ![CLLocationManager locationServicesEnabled ]) {
    [theHomeView.theHomeButton setEnabled:[CLLocationManager locationServicesEnabled ]];
    UIAlertView *theNoLocatiobServicesAlert = [[UIAlertView alloc] initWithTitle:@"Service de localisation non activé" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [theNoLocatiobServicesAlert show];
    return;
  }
 
  [theHomeView.theLocationManager startUpdatingLocation];
  
}

-(void) clearMap{
  //--------------------------------------------------------------------------------------------------------
  
  NSLog(@"Clear map");
  
  [theHomeView.theMap removeAnnotations:theHomeView.theMap.annotations];

  
}

@end

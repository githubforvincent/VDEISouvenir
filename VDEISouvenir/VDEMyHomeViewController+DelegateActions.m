//
//  VDEMyHomeViewController+DelegateActions.m
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeViewController+DelegateActions.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import "VDEMyHomeViewController+HandleSubViewsActions.h"

@implementation VDEMyHomeViewController (DelegateActions)


//------------------------------------------------------------------------------
#pragma mark theMapDelegates
//------------------------------------------------------------------------------

-(void) mapView:(MKMapView*)map regionDidChangeAnimated:(BOOL)animated {
//------------------------------------------------------------------------------
  
  // NSLog(@"map changed");
}

-(MKAnnotationView* ) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//------------------------------------------------------------------------------
 
  
   if( annotation == [mapView userLocation]) {
    return nil; // we are at the current location
  }
   
  MKPinAnnotationView *thePin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"vdeAnnotation"];
  [thePin setPinColor:MKPinAnnotationColorGreen];
  [thePin setCanShowCallout:YES];
  [thePin setAnimatesDrop:YES];
  [thePin setDraggable:YES];
  [thePin setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
  
  
  return thePin;

}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotation calloutAccessoryControlTapped:(UIControl *)control {
//------------------------------------------------------------------------------
 
  [self associateContact:annotation];
  
}
//------------------------------------------------------------------------------
#pragma mark  theLocationManagerDelegates
//------------------------------------------------------------------------------

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  //------------------------------------------------------------------------------
  NSLog(@"entrée location manager delegate ");
  
  CLLocationCoordinate2D theCoord = {.latitude = [[locations lastObject] coordinate].latitude, .longitude = [[locations lastObject] coordinate].longitude};
  MKCoordinateSpan theSpan        = {.latitudeDelta = 0.035, .longitudeDelta = 0.0335};
  MKCoordinateRegion theRegion    = {theCoord,theSpan};
  
  [theHomeView.theMap setRegion:theRegion animated:YES];
  [theHomeView.theMap setNeedsDisplay];
  [theHomeView.theMap setShowsUserLocation:YES];

  [theHomeView.theLocationManager stopUpdatingLocation];

  
}


//------------------------------------------------------------------------------
#pragma mark  theAddressBookDelegates
//------------------------------------------------------------------------------

-(BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
  //------------------------------------------------------------------------------
  
  NSString *lastName;
  NSString *firstName;
  
  if ( ABRecordCopyValue(person, kABPersonFirstNameProperty)!= NULL) {
    firstName = (__bridge NSString *) ABRecordCopyValue(person, kABPersonFirstNameProperty);
  } else {
    firstName = @"-";
  }
  
  if ( ABRecordCopyValue(person, kABPersonLastNameProperty)!= NULL) {
    lastName  = (__bridge NSString *) ABRecordCopyValue(person, kABPersonLastNameProperty);
  } else {
    lastName = @"-";
  }
  
  VDEMyAnnotation *currentAnnotation=[self.selectedAnnotation annotation];
  [currentAnnotation setTitle:[NSString stringWithFormat:@"%@ %@",firstName,lastName]];
  
  if ( self.isIPhone) {
    [self dismissViewControllerAnimated:YES completion:nil];
  } else {
    [self.thePopOverController dismissPopoverAnimated:YES];
  }
  

  //self.selectedAnnotation.tintColor = [UIColor redColor];

  
  
  return NO; // do not go forward into the contact detail
}

-(void) peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
  //------------------------------------------------------------------------------
  [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:
(ABMultiValueIdentifier)identifier {
  //------------------------------------------------------------------------------
  
  return NO;
}

//------------------------------------------------------------------------------
#pragma mark  thePopOverDelegates
//------------------------------------------------------------------------------

-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
  //------------------------------------------------------------------------------
  NSLog(@"dismiss popover delegate");
}

-(BOOL) popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController{
  //------------------------------------------------------------------------------
 return YES;
}

@end

//
//  VDEMyHomeViewController+HandleSubViewsActions.h
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeViewController.h"

@interface VDEMyHomeViewController (HandleSubViewsActions)

-(void) addPinToMap;
-(void) activateMapView;
-(void) activateSatelliteView;
-(void) goToCurrentLocation;
-(void) clearMap;
-(void) associateContact:(MKAnnotationView*) selectedAnnotation;



@end

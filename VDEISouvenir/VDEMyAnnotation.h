//
//  VDEMyAnnotation.h
//  VDEISouvenir
//
//  Created by Utilisation on 05/06/14.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface VDEMyAnnotation : NSObject <MKAnnotation>

@property (nonatomic,assign)  CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)   NSString* title;


@end

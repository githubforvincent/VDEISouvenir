//
//  VDEViewController.h
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "VDEMyHomeView.h"
#import "VDEMyAnnotation.h"

@interface VDEMyHomeViewController : UIViewController  {
//----------------------------------------------------------------------------

  VDEMyHomeView   *theHomeView;

 
}

@property (nonatomic, getter = isIPad)    BOOL    	iPad;
@property (nonatomic, getter = isIPhone)  BOOL    iPhone;

@property (nonatomic)                     int     thePinCounter;
@property (nonatomic, strong) MKAnnotationView    *selectedAnnotation;
@property (nonatomic,strong) UIPopoverController  *thePopOverController;


@end

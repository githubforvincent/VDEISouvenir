//
//  VDEMyHomeView+DisplayViews.m
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeView+DisplaySubViews.h"
#import "VDEMyHomeViewController.h"

@implementation VDEMyHomeView (DisplaySubViews)

-(void) displayTheSubViewsWithOrientation:(UIInterfaceOrientation) currentOrientation {
  
  
  // Screen size calculations and frame refresh from orientation
	//--------------------------------------------------------------------------------------------------------
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
  int theViewWidth, theViewHeight;
  
  if (currentOrientation == UIInterfaceOrientationLandscapeLeft || currentOrientation==UIInterfaceOrientationLandscapeRight)
  {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.height, screenRect.size.width);
    theViewWidth  = [[UIScreen mainScreen] bounds].size.height;
    theViewHeight = [[UIScreen mainScreen] bounds].size.width;
  }else {
		self.frame = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);
    theViewWidth  = [[UIScreen mainScreen] bounds].size.width;
    theViewHeight = [[UIScreen mainScreen] bounds].size.height;
  }
  
  // the toolbar
  //----------------------------------------------------------------------------------------
  int theToolBarX       = 0;
  int theToolBarWidth   = theViewWidth;
  int theToolBarHeight;
  if (self.theViewController.isIPhone){
    theToolBarHeight=44;
  } else {
    theToolBarHeight=60;
  }
  int theToolBarY       = theViewHeight-theToolBarHeight;
  
  [theToolBar setFrame:CGRectMake(theToolBarX,theToolBarY,theToolBarWidth, theToolBarHeight)];
  
  // the map
  //----------------------------------------------------------------------------------------
  int theMapX       = 0;
  int theMapY       = 0; // height for iOS7. Should be dynamic with phone call
  int theMapWidth   = theViewWidth;
  int theMapHeight  = theViewHeight+20;//-theMapY;

  [self.theMap setFrame:CGRectMake(theMapX, theMapY,theMapWidth, theMapHeight)];

  // the StatusBarOverlay
  //----------------------------------------------------------------------------------------
  int theStatusBarOverlayX = 0;
  int theStatusBarOverlayY = 0;
  int theStatusBarOverlayWidth= theViewWidth;
  int theStatusBarOverlayHeight = 20;
  
  [theStatusBarOverlay setFrame:CGRectMake(theStatusBarOverlayX,
                                           theStatusBarOverlayY,
                                           theStatusBarOverlayWidth,
                                           theStatusBarOverlayHeight)];
  
  
  [self setNeedsDisplay];
    
  [self.theHomeButton setEnabled:[CLLocationManager locationServicesEnabled ]];
  if ( ![CLLocationManager locationServicesEnabled ]) {
    UIAlertView *theNoLocatiobServicesAlert = [[UIAlertView alloc] initWithTitle:@"Service de localisation non activé" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [theNoLocatiobServicesAlert show];
  }
  

}


@end

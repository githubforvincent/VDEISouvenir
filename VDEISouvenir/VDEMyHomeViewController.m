//
//  VDEViewController.m
//  VDEISouvenir
//
//  Created by Utilisation on 04/06/2014.
//  Copyright (c) 2014 Utilisation. All rights reserved.
//

#import "VDEMyHomeViewController.h"
#import "VDEMyHomeView+ConfigureSubViews.h"
#import "VDEMyHomeView+DisplaySubViews.h"
#import "VDEMyHomeViewController+HandleSubViewsActions.h"

@interface VDEMyHomeViewController ()

@end

@implementation VDEMyHomeViewController

- (void)viewDidLoad {
	//--------------------------------------------------------------------------------------------------------
  
  [super viewDidLoad];
  
  // Device type
  self.iPhone = ([[UIDevice currentDevice] userInterfaceIdiom ]== UIUserInterfaceIdiomPhone);
  self.iPad   = !(self.isIPhone);
  
	// initialisation vue
	theHomeView = [[VDEMyHomeView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  theHomeView.theViewController = self;
  [[self view] addSubview:theHomeView];
  
  // Initial configuration
  [theHomeView configureSubviews ];

  // Initialize the annotation selected for addinf a contact
  self.selectedAnnotation = [[MKAnnotationView alloc]init];
  
	// Initial display - Reading the status bar orientatino gives the positino of the device
  [theHomeView displayTheSubViewsWithOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
  
  //going to current location
  [self goToCurrentLocation];
  
}

-(BOOL) shouldAutorotate {
	//--------------------------------------------------------------------------------------------------------
  return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)theNewOrientation duration:(NSTimeInterval)d {
  //--------------------------------------------------------------------------------------------------------
  

  [theHomeView displayTheSubViewsWithOrientation:theNewOrientation];
  
}

- (void)didReceiveMemoryWarning {
	//--------------------------------------------------------------------------------------------------------
  [super didReceiveMemoryWarning];
  NSLog(@"Alerte mémoire");
  
  
}



@end

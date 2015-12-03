//
//  NGWLocationViewController.h
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 04/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGWVenue;

@interface NGWLocationsListViewController : UIViewController
/// Updates venue objects and reloads view
///
/// @param locations Array of NGWVenue objects that should be displayed
///
- (void)updateCollectionWithItems:(NSArray <NGWVenue *> *)locations;
@end

//
//  NGWMapViewController.h
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 04/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class NGWMapViewController;

@protocol NGWMapViewControllerDelegate <NSObject>

/**
 *  Informs about changes on map. Invokes after pin drop or move.
 *
 *  @param controller Sender of message.
 *  @param location   Location after change.
 */
- (void)mapViewController:(nonnull NGWMapViewController *)controller didChangeToLocation:(nonnull CLLocation *)location;

@end

@interface NGWMapViewController : UIViewController

/**
 *  Centers map to given coordinate animated.
 *
 *  @param coordinate Coordinate which will be in the center of map.
 *  @param animated   Indicates if transition on map should be animated or not.
 */
- (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;

/**
 *  The receivers delegate.
 */
@property (strong, nonatomic, nullable) id <NGWMapViewControllerDelegate> delegate;

@end

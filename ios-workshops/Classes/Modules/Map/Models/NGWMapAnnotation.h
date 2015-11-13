//
//  NGWMapAnnotation.h
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NGWMapAnnotation : NSObject <MKAnnotation>

/**
 *  Address shown in annotation view.
 */
@property (strong, nonatomic, nullable) NSString *address;

/**
 *  Cooridnate of map annotation.
 */
@property (assign, readonly, nonatomic) CLLocationCoordinate2D coordinate;

/**
 *  Sets coordinate of annotation.
 */
- (void)setCoordinate:(CLLocationCoordinate2D)coordinate;

@end

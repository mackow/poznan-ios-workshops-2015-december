//
//  NGWGeocoder.h
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 12/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NGWGeocoder : NSObject

/**
 *  Underneath geocoder used for reverse geocoding.
 */
@property (strong, nonatomic, nonnull) CLGeocoder *geocoder;

/**
 *  Reverse geocodes given coordinates.
 *
 *  @param coordinate Coordinate to geocode.
 */
- (void)reverseGeocode:(CLLocationCoordinate2D)coordinate withCompletion:(nonnull void (^)(CLPlacemark * _Nullable placemark, NSError * _Nullable error))completion;

@end

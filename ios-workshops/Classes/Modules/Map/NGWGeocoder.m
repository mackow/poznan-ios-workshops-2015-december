//
//  NGWGeocoder.m
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 12/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWGeocoder.h"

@implementation NGWGeocoder

- (instancetype)init {
    self = [super init];
    if (self) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return self;
}

#pragma mark - Geocoding

- (void)reverseGeocode:(CLLocationCoordinate2D)coordinate withCompletion:(nonnull void (^)(CLPlacemark * _Nullable placemark, NSError * _Nullable error))completion {
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        completion (placemarks[0], error);
    }];
}

@end

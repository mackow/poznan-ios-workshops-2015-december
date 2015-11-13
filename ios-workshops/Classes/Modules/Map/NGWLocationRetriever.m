//
//  NGWLocationRetriever.m
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 12/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "NGWLocationRetriever.h"

@interface NGWLocationRetriever () <CLLocationManagerDelegate>

@property (copy, nonatomic, nullable) void (^completion)(CLLocation *, NSError *);

@end

@implementation NGWLocationRetriever

- (instancetype)init {
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.distanceFilter = 100;
    }
    return self;
}

#pragma mark - Geocoding

- (void)obtainUserLocationWithCompletion:(void (^)(CLLocation * _Nullable, NSError * _Nullable))completion {
    
    self.completion = completion;
    
    if (completion != NULL) {
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.completion) {
        self.completion(nil, error);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    if (self.completion) {
        self.completion(locations.lastObject, nil);
    }

    [self.locationManager stopUpdatingLocation];
}

@end

//
//  NGWVenue.h
//  ios-workshops
//
//  Created by Adrian Kashivskyy on 06.11.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NGWVenue : NSObject

NS_ASSUME_NONNULL_BEGIN

/// Initializes a venue.
///
/// @param dictionary The JSON dictionary representation of a venue.
/// @param error An error which might have occured during deserialization.
///
/// @returns An instance of venue model or `nil` if an error occured.
- (nullable instancetype)initWithJSONDictionary:(NSDictionary<NSString *, id> *)dictionary error:(NSError * _Nullable * _Nullable)error;

/// Creates an array of deserialized venues from an array of JSON objects.
///
/// @param array The JSON array containing JSON dictionaries received from the API.
/// @param error An error which might have occured during deserialization.
///
/// @returns An array of venues or `nil` if an error occured.
+ (nullable NSArray<NGWVenue *> *)venuesWithJSONArray:(NSArray<NSDictionary<NSString *, id> *> *)array error:(NSError **)error;

/// The unique identifier of the venue.
@property (strong, nonatomic, readonly) NSString *identifier;

/// The name of the venue.
@property (strong, nonatomic, readonly) NSString *name;

/// Distance to the venue in
@property (assign, nonatomic, readonly) CLLocationDistance distance;

/// The map item of the venue.
@property (strong, nonatomic, readonly) MKMapItem *mapItem;

NS_ASSUME_NONNULL_END

@end

#pragma mark -

@interface NGWVenue (Unavailable)

- (nullable instancetype)init NS_UNAVAILABLE;

@end

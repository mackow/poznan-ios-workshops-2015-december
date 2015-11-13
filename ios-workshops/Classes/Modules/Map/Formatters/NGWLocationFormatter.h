//
//  NGWLocationFormatter.h
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLPlacemark;

@interface NGWLocationFormatter : NSObject

/**
 *  Formats placemark to human-readable text.
 *
 *  @param placemark Placemark to format
 *
 *  @return Formatted location string.
 */
+ (nullable NSString  *)formattedLocationStringForPlacemark:(nullable CLPlacemark *)placemark;

@end

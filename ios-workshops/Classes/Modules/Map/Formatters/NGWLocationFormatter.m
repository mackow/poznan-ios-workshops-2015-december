//
//  NGWLocationFormatter.m
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>

#import "NGWLocationFormatter.h"

@implementation NGWLocationFormatter

+ (NSString *)formattedLocationStringForPlacemark:(CLPlacemark *)placemark {
    NSArray *formattedLocationArray = placemark.addressDictionary[@"FormattedAddressLines"];
    
    if (formattedLocationArray.count > 1) {
        return [NSString stringWithFormat:@"%@ %@", formattedLocationArray[0], formattedLocationArray[0]];
    } else if (formattedLocationArray.count > 0) {
        return [NSString stringWithFormat:@"%@", formattedLocationArray[0]];
    }
    
    CNMutablePostalAddress *address = [[CNMutablePostalAddress alloc] init];
    address.city = placemark.locality;
    address.state = placemark.administrativeArea;
    address.postalCode = placemark.postalCode;
    address.country = placemark.country;
    address.ISOCountryCode = placemark.ISOcountryCode;
    
    NSMutableString *street = [NSMutableString string];
    if (placemark.thoroughfare) {
        [street appendString:placemark.thoroughfare];
    }
    if (placemark.thoroughfare && placemark.subThoroughfare) {
        [street appendString:@" "];
    }
    if (placemark.subThoroughfare) {
        [street appendString:placemark.subThoroughfare];
    }
    
    address.street = [street copy];
    
    NSString *formattedAddress = [CNPostalAddressFormatter stringFromPostalAddress:address style:CNPostalAddressFormatterStyleMailingAddress];
    return [formattedAddress stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}

@end

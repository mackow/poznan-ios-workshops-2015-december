//
//  NGWMapAnnotation.m
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWMapAnnotation.h"

@implementation NGWMapAnnotation

- (NSString *)subtitle {
    if (self.address) {
        return self.address;
    }
    return NSLocalizedString(@"Unkown...", nil);
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
}

@end

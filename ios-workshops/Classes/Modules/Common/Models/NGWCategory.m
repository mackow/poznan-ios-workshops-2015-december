//
//  NGWCategory.m
//  ios-workshops
//
//  Created by Adrian Kashivskyy on 12.11.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWCategory.h"

@implementation NGWCategory

#pragma mark Initialization

- (instancetype)initWithJSONDictionary:(NSDictionary<NSString *, id> *)json error:(NSError * __autoreleasing *)error {
	if ((self = [super init])) {
        _identifier = json[@"id"];
        _name = json[@"name"];
        NSString *imageURL = [NSString stringWithFormat:@"%@32%@", json[@"icon"][@"prefix"], json[@"icon"][@"suffix"]];
        _image = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
	}
	return self;
}

+ (NSArray<NGWCategory *> *)categoriesWithJSONArray:(NSArray<NSDictionary<NSString *, id> *> *)array error:(NSError * __autoreleasing *)error {
	NSMutableArray *mutableArray = [NSMutableArray array];
	for (NSDictionary<NSString *, id> *dictionary in array) {
        /// Only main category
		NGWCategory *category = [[NGWCategory alloc] initWithJSONDictionary:dictionary error:error];
		if (*error != nil) {
			return nil;
		} else {
			[mutableArray addObject:category];
		}
	}
	return [NSArray arrayWithArray:mutableArray];
}

@end

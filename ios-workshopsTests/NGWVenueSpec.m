//
//  NGWVenueSpec.m
//  ios-workshops
//
//  Created by Adrian Kashivskyy on 13.11.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Expecta/Expecta.h>
#import <MapKit/MapKit.h>
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>

#import "NGWVenue.h"

SpecBegin(NGWVenue)

describe(@"NGWVenue", ^{
	
	describe(@"initializing single venue", ^{
		
		__block NSDictionary *jsonDictionary = nil;
		
		beforeAll(^{
			NSData *jsonData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Venue" withExtension:@"json"]];
			jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
		});
		
		it(@"should succeed with correct json dictionary representation", ^{
			
			NSError *error = nil;
			NGWVenue *venue = [[NGWVenue alloc] initWithJSONDictionary:jsonDictionary error:&error];
			
			expect(venue).toNot.beNil();
			expect(error).to.beNil();
			
			expect(venue.identifier).to.equal(jsonDictionary[@"id"]);
			expect(venue.name).to.equal(jsonDictionary[@"name"]);
			expect(@(venue.distance)).to.equal(jsonDictionary[@"location"][@"distance"]);
			
			expect(@(venue.mapItem.placemark.coordinate.latitude)).to.equal(jsonDictionary[@"location"][@"lat"]);
			expect(@(venue.mapItem.placemark.coordinate.longitude)).to.equal(jsonDictionary[@"location"][@"lng"]);
			
			expect(venue.mapItem.placemark.thoroughfare).to.equal(jsonDictionary[@"location"][@"address"]);
			expect(venue.mapItem.placemark.postalCode).to.equal(jsonDictionary[@"location"][@"postalCode"]);
			expect(venue.mapItem.placemark.countryCode).to.equal(jsonDictionary[@"location"][@"cc"]);
			expect(venue.mapItem.placemark.locality).to.equal(jsonDictionary[@"location"][@"city"]);
			expect(venue.mapItem.placemark.administrativeArea).to.equal(jsonDictionary[@"location"][@"state"]);
			
			expect(venue.mapItem.name).to.equal(jsonDictionary[@"name"]);
			expect([[venue.mapItem.phoneNumber componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+0123456789"].invertedSet] componentsJoinedByString:@""]).to.equal(jsonDictionary[@"contact"][@"phone"]);
			expect(venue.mapItem.url.absoluteString).to.equal(jsonDictionary[@"url"]);
			
		});
		
	});
	
	pending(@"initializing muntiple venues", ^{
		
	});
	
});

SpecEnd

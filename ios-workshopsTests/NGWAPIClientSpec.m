//
//  NGWAPIClientSpec.m
//  ios-workshops
//
//  Created by Adrian Kashivskyy on 13.11.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>

#import "NGWAPIClient.h"

SpecBegin(NGWAPIClient)

describe(@"NGWAPIClient", ^{
	
	__block NGWAPIClient *sut = nil;
	
	afterEach(^{
		sut = nil;
	});
	
	context(@"when initialized with invalid keys", ^{
		
		beforeEach(^{
			sut = [[NGWAPIClient alloc] initWithClientIdentifier:@"foo" clientSecret:@"bar"];
		});
		
		it(@"should fail to fetch venues", ^{
			__block NSArray<NGWVenue *> *venues = nil;
			__block NSError *error = nil;
			waitUntil(^(DoneCallback done) {
				[sut getVenuesNearCoordinate:CLLocationCoordinate2DMake(0, 0) radius:0 query:nil categories:nil completion:^(NSArray<NGWVenue *> *gotVenues, NSError *gotError) {
					venues = gotVenues;
					error = gotError;
					done();
				}];
			});
			expect(venues).to.beNil();
			expect(error).notTo.beNil();
		});
		
		it(@"should fail to fetch categories", ^{
			__block NSArray<NGWCategory *> *categories = nil;
			__block NSError *error = nil;
			waitUntil(^(DoneCallback done) {
				[sut getCategoriesWithCompletion:^(NSArray<NGWCategory *> *gotCategories, NSError *gotError) {
					categories = gotCategories;
					error = gotError;
					done();
				}];
			});
			expect(categories).to.beNil();
			expect(error).notTo.beNil();
		});
		
	});
	
	context(@"when intialized with valid keys", ^{
		
		pending(@"it should succeed to fetch venues", ^{
			
		});
		
		pending(@"it should succeed to fetch categories", ^{
			
		});
		
	});
	
});

SpecEnd

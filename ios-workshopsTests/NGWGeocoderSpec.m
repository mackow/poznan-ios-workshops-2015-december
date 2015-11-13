//
//  NGWGeocoderSpec.m
//  ios-workshops
//
//  Created by Patryk Kaczmarek on 12/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>

#import "NGWGeocoder.h"

SpecBegin(NGWGeocoder)

describe(@"NGWGeocoder", ^{
    
    /**  SPEC HELPERS BEGIN **/
    
    void (^setupGeocoder)(NGWGeocoder *, NSArray *, NSError *) = ^(NGWGeocoder *sut, NSArray *placemarks, NSError *error) {
        
        void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
            
            CLGeocodeCompletionHandler completionHandler;
            [invocation getArgument:&completionHandler atIndex:3];
            completionHandler(placemarks, error);
        };
        
        CLGeocoder *mockedGeocoder = [OCMockObject mockForClass:[CLGeocoder class]];
        OCMStub([mockedGeocoder reverseGeocodeLocation:OCMOCK_ANY completionHandler:OCMOCK_ANY]).andDo(proxyBlock);
        sut.geocoder = mockedGeocoder;
    };
    
    /**  SPEC HELPERS END **/
    
    
    /** ACTUAL SPEC BELOW **/
    
    __block NGWGeocoder *sut = nil;
    __block CLPlacemark *placemark = nil;
    __block NSError *error = nil;
    
    beforeEach(^{
        sut = [[NGWGeocoder alloc] init];
    });
    
    afterEach(^{
        sut = nil;
        placemark = nil;
        error = nil;
    });
    
    context(@"when geocoding coordinate", ^{
        
        describe(@"and something gone wrong", ^{
            
            beforeEach(^{
                NSError *error = [NSError errorWithDomain:@"fixture.error.domain" code:1000 userInfo:nil];
                setupGeocoder(sut, nil, error);
            });
            
            it(@"error should not be nil", ^{
                
                waitUntil(^(DoneCallback done) {
                    [sut reverseGeocode:CLLocationCoordinate2DMake(0, 0) withCompletion:^(CLPlacemark * _Nullable _placemark, NSError * _Nullable _error) {
                        placemark = _placemark;
                        error = _error;
                        done();
                    }];
                });
                
                expect(error).toNot.beNil();
                expect(placemark).to.beNil();
            });
        });
        
        describe(@"and geocoding succeeds", ^{
            
            beforeEach(^{
                MKPlacemark *mockPlacemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(-90.0987654321, 179.1234) addressDictionary:nil];
                CLPlacemark *placemark = [[CLPlacemark alloc] initWithPlacemark:mockPlacemark];
                setupGeocoder(sut, @[placemark], nil);
            });
            
            it(@"placemark should have properly set coordinate", ^{
                
                waitUntil(^(DoneCallback done) {
                    [sut reverseGeocode:CLLocationCoordinate2DMake(0, 0) withCompletion:^(CLPlacemark * _Nullable _placemark, NSError * _Nullable _error) {
                        placemark = _placemark;
                        error = _error;
                        done();
                    }];
                });
                
                expect(error).to.beNil();
                expect(placemark.location.coordinate).to.equal(CLLocationCoordinate2DMake(-90.0987654321, 179.1234));
            });
        });
    });
});

SpecEnd

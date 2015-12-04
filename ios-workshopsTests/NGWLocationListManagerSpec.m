//
//  NGWLocationListManagerSpec.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 12/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "NGWLocationListManager.h"
#import "NGWVenue.h"

SpecBegin(NGWLocationListManager)

     /**  SPEC HELPERS BEGIN **/

    NSArray<NGWVenue *> * (^setupVenueArray)(NSUInteger) = ^NSArray <NGWVenue *> *(NSUInteger numberOfItems) {
        NSMutableArray <NGWVenue *>*venueArray = [NSMutableArray array];
        for(NSUInteger i = 0; i < numberOfItems; i++) {
            [venueArray addObject:[OCMockObject mockForClass:[NGWVenue class]]];
        }
        return venueArray.copy;
    };

    /**  SPEC HELPERS END **/


    /** ACTUAL SPEC BELOW **/

    __block NGWLocationListManager *sut;
    __block UICollectionView *cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];


    beforeEach(^{
        sut = [[NGWLocationListManager alloc] initWithCollectionView:cv];
        cv.delegate = sut;
        cv.dataSource = sut;
    });

    afterEach(^{
        sut = nil;
    });

    context(@"When updating", ^{
        describe(@"with 3 items", ^{
            beforeEach(^{
                [sut updateCollectionWithItems:setupVenueArray(3)];
            });
            
            it(@"should return 3 items", ^{
                NSUInteger itemsCount = [sut collectionView:cv numberOfItemsInSection:0];
                expect(itemsCount).to.equal(3);
            });
        });
        
        describe(@"with 1 item or more", ^{
            beforeEach(^{
                [sut updateCollectionWithItems:@[[OCMockObject niceMockForClass:[NGWVenue class]]]];
            });
            
            it(@"should return a valid cell", ^{
                __kindof UICollectionViewCell *cell = [sut collectionView:cv cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
                expect(cell).toNot.beNil();
            });
        });
        
    });
SpecEnd

//
//  NGWLocationListManager.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWLocationListManager.h"

#import "NGWVenue.h"

@interface NGWLocationListManager ()
@property (strong, nonatomic, nullable) NSArray<NGWVenue *> *locations;
@property (weak, nonatomic, nullable) UICollectionView *collectionView;
@end

@implementation NGWLocationListManager

#pragma mark - public

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
    self = [super init];
    if (self) {
        _collectionView = collectionView;
    }
    return self;
}

- (void)updateCollectionWithItems:(NSArray<NGWVenue *> *)locations {
    self.locations = locations;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate / UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.locations count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    return cell;
}
@end

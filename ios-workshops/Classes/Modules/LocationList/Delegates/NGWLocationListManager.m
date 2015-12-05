//
//  NGWLocationListManager.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWLocationListManager.h"

#import "NGWVenue.h"
#import "NGWVenueCell.h"

static NSString * const NGWCellReuseIdentifier = @"VenueCell";
static CGFloat const NGWColectionViewCellHeight = 50.0f;
static CGFloat const NGWColectionViewCellWidth = 150.0f;

@interface NGWLocationListManager ()
@property (strong, nonatomic, nullable) NSArray<NGWVenue *> *locations;
@property (weak, nonatomic, nullable) UICollectionView *collectionView;
@end

@implementation NGWLocationListManager

#pragma mark - Public

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        [self.collectionView registerClass:[NGWVenueCell class] forCellWithReuseIdentifier:NGWCellReuseIdentifier];
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
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NGWVenueCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NGWCellReuseIdentifier forIndexPath:indexPath];
    cell.venue = [self.locations objectAtIndex:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(NGWColectionViewCellWidth, NGWColectionViewCellHeight);
}
@end

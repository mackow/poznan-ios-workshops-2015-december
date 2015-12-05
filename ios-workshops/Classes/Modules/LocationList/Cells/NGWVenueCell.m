//
//  NGWVenueCell.m
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 30.11.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWVenueCell.h"
#import "NGWVenue.h"
#import <PureLayout/PureLayout.h>

static CGFloat const NGWVenueNameFontSize = 10.0f;

@interface NGWVenueCell ()
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation NGWVenueCell

#pragma mark - Public

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    return self;
}

#pragma mark - Custom Accessors

- (void) setVenue:(NGWVenue *)venue {
    _venue = venue;
    self.name.text = venue.name;
}

#pragma mark - Private

- (void)configureView {
    self.name = [[UILabel alloc] initWithFrame:CGRectZero];
    self.name.font = [UIFont systemFontOfSize:NGWVenueNameFontSize];
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.lineBreakMode = NSLineBreakByWordWrapping;
    self.name.numberOfLines = 0;
    [self addSubview:self.name];
    [self.name autoPinEdgesToSuperviewEdges];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.imageView];
    [self.imageView autoPinEdgesToSuperviewEdges];
}
@end

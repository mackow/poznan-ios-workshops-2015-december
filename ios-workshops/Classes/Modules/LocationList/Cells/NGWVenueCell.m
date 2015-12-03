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

@interface NGWVenueCell ()
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation NGWVenueCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.name = [[UILabel alloc] initWithFrame:frame];
        self.name.font = [UIFont systemFontOfSize:8.0f];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.lineBreakMode = NSLineBreakByWordWrapping;
        self.name.numberOfLines = 0;
        [self addSubview:self.name];
        [self.name autoPinEdgesToSuperviewEdges];
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:self.imageView];
        [self.imageView autoPinEdgesToSuperviewEdges];        
    }
    return self;
}

- (void) setVenue:(NGWVenue *)venue {
    _venue = venue;
    self.name.text = venue.name;
}

- (void) setImage:(UIImage*)image {
    self.imageView.image = image;
}

@end

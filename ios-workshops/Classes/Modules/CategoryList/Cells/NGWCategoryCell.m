//
//  NGWCategoryCell.m
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWCategoryCell.h"

#import "NGWCategory.h"

#define kCategoryCellBackgroundColor [UIColor lightGrayColor]
#define kCategoryNameTextColor [UIColor whiteColor]

static CGFloat const NGWCategoryImageSize = 32.0f;
static CGFloat const NGWCategoryNameFontSize = 14.0f;
static CGFloat const NGWInset = 10.0f;

@import PureLayout;

@interface NGWCategoryCell ()
@property (strong, nonatomic) UILabel *categoryName;
@property (strong, nonatomic) UIImageView *categoryImageView;
@end

@implementation NGWCategoryCell

#pragma mark - Public

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

#pragma mark - Custom Accessors

- (void) setCategory:(NGWCategory *)category {
    _category = category;
    [self prepareCell];
}

#pragma mark - Private

- (void)configureView {
    self.backgroundColor = kCategoryCellBackgroundColor;
    
    self.categoryImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.categoryImageView];
    [self.categoryImageView autoSetDimensionsToSize:CGSizeMake(NGWCategoryImageSize, NGWCategoryImageSize)];
    [self.categoryImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:NGWInset];
    [self.categoryImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.categoryName = [[UILabel alloc] initWithFrame:CGRectZero];
    self.categoryName.font = [UIFont systemFontOfSize:NGWCategoryNameFontSize];
    self.categoryName.textColor = kCategoryNameTextColor;
    self.categoryName.textAlignment = NSTextAlignmentLeft;
    self.categoryName.lineBreakMode = NSLineBreakByWordWrapping;
    self.categoryName.numberOfLines = 0;
    [self addSubview:self.categoryName];
    [self.categoryName autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.categoryName autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.categoryName autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.categoryImageView withOffset:NGWInset];
    [self.categoryName autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:NGWInset];
    [self.categoryName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (void) prepareCell {
    self.categoryName.text = self.category.name;
    self.categoryImageView.image = [UIImage imageWithData:self.category.image];
}
@end

//
//  NGWCategoriesListManager.h
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWSelectCategoryDelegate.h"

@import UIKit;

@class NGWCategory;

@interface NGWCategoryListManager : NSObject <UITableViewDataSource, UITableViewDelegate>
- (nullable instancetype)init NS_UNAVAILABLE;
- (nullable instancetype)initWithTableView:(nonnull UITableView *)tableView NS_DESIGNATED_INITIALIZER;

/// Updates category objects and reloads table view
///
/// @param locations Array of NGWCategory objects that should be displayed
///
- (void)updateTableWithItems:(nullable NSArray <NGWCategory *> *)categories;

/**
 *  The receivers delegate.
 */
@property (weak, nonatomic, nullable) id <NGWSelectCategoryDelegate> selectCategoryDelegate;
@end

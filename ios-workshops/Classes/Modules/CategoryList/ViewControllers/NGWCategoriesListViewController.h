//
//  NGWCategoriesListViewController.h
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NGWSelectCategoryDelegate.h"

@class NGWCategory;

@interface NGWCategoriesListViewController : UIViewController
/// Updates category objects and reloads view
///
/// @param categories Array of NGWCategory objects that should be displayed
///
- (void)updateTableWithItems:(NSArray <NGWCategory *> * _Nullable)categories;

/**
 *  The receivers delegate.
 */
@property (weak, nonatomic, nullable) id <NGWSelectCategoryDelegate> selectCategoryDelegate;
@end

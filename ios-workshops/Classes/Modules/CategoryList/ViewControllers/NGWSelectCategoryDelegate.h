///Users/mkowszewicz/Desktop/netguru/poznan-ios-workshops-2015-december/ios-workshops
//  NGWSelectCategoryDelegate.h
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGWCategory;

/**
 *  Informs about choosing category.
 *
 *  @param category Selected category.
 */
@protocol NGWSelectCategoryDelegate <NSObject>
- (void)selectCategory:(nullable NGWCategory*)category;
@end

//
//  NGWCoreDataStack.h
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

@import SLCoreDataStack;

@interface NGWCoreDataStack : SLCoreDataStack
+ (instancetype)sharedStack;
@end

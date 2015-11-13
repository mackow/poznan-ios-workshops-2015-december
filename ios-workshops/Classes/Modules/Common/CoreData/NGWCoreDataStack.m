//
//  NGWCoreDataStack.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 09/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWCoreDataStack.h"

@implementation NGWCoreDataStack
+ (instancetype)sharedStack {
    static NGWCoreDataStack *sharedCoreDataStack = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCoreDataStack = [[self alloc] init];
    });
    return sharedCoreDataStack;
}

- (instancetype)init {
    NSURL *documentsLocation = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"NGWWorkshops" withExtension:@"momd"];
    self = [super initWithType:NSSQLiteStoreType location:documentsLocation model:modelURL inBundle:nil];
    if (self) {
        
    }
    return self;
}
@end

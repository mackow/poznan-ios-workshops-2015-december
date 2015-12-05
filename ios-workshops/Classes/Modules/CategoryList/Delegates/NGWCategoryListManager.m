//
//  NGWCategoriesListManager.m
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWCategoryListManager.h"

#import "NGWCategory.h"
#import "NGWCategoryCell.h"

static NSString * const NGWCellReuseIdentifier = @"CategoryCell";

@interface NGWCategoryListManager ()
@property (strong, nonatomic, nullable) NSArray<NGWCategory *> *categories;
@property (weak, nonatomic, nullable) UITableView *tableView;
@end

@implementation NGWCategoryListManager

@synthesize selectCategoryDelegate;

#pragma mark - Public

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
        [self.tableView registerClass:[NGWCategoryCell class] forCellReuseIdentifier:NGWCellReuseIdentifier];
    }
    return self;
}

- (void)updateTableWithItems:(NSArray *)categories {
    self.categories = categories;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource / UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.categories count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NGWCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:NGWCellReuseIdentifier forIndexPath:indexPath];
    cell.category = [self.categories objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NGWCategory *category = [self.categories objectAtIndex:indexPath.row];
    [self.selectCategoryDelegate selectCategory:category];
}
@end

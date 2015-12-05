//
//  NGWCategoriesListViewController.m
//  ios-workshops
//
//  Created by Maciej Kowszewicz on 05.12.2015.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWCategoriesListViewController.h"

#import "NGWCategoryListManager.h"

@import PureLayout;

#define kBackgroundColor [UIColor lightGrayColor]

static CGFloat const NGWActivityIndicatorViewSize = 30.0f;

@interface NGWCategoriesListViewController () <NGWSelectCategoryDelegate>
@property (assign, nonatomic) BOOL didSetConstraints;

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UITableView *categoriesListTableView;
@property (strong, nonatomic) NGWCategoryListManager *categoryListManager;
@end

@implementation NGWCategoriesListViewController

@synthesize selectCategoryDelegate;

#pragma mark - Public

- (void)updateTableWithItems:(NSArray <NGWCategory *> *)categories {
    [self.categoryListManager updateTableWithItems:categories];
    [self.activityIndicatorView stopAnimating];
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self.activityIndicatorView startAnimating];
}

- (void)loadView {
    self.view = [UIView new];
}

#pragma mark - Private


- (void)configureView {
    self.view.backgroundColor = kBackgroundColor;
    self.edgesForExtendedLayout=UIRectEdgeNone;

    self.categoriesListTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.categoriesListTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.categoriesListTableView];
    [self.categoriesListTableView autoPinEdgesToSuperviewEdges];
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initForAutoLayout];
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView autoSetDimensionsToSize:CGSizeMake(NGWActivityIndicatorViewSize, NGWActivityIndicatorViewSize)];
    [self.activityIndicatorView autoCenterInSuperview];
    
    self.categoryListManager = [[NGWCategoryListManager alloc] initWithTableView:self.categoriesListTableView];
    self.categoryListManager.selectCategoryDelegate = self;
    self.categoriesListTableView.delegate = self.categoryListManager;
    self.categoriesListTableView.dataSource = self.categoryListManager;
    self.categoriesListTableView.backgroundColor = kBackgroundColor;
    self.categoriesListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Clear filter", nil) style:UIBarButtonItemStylePlain target:self action:@selector(clearFilterBarButtonDidTap:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonDidTap:)];
}

#pragma mark - IBActions

- (void)clearFilterBarButtonDidTap:(UIBarButtonItem *)button {
    [self.selectCategoryDelegate selectCategory:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelButtonDidTap:(UIBarButtonItem *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - NGWSelectCategoryDelegate

- (void)selectCategory:(NGWCategory*)category {
    [self.selectCategoryDelegate selectCategory:category];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

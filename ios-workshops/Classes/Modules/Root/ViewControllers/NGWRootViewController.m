//
//  NGWRootViewController.m
//  ios-workshops
//
//  Created by Kamil Tomaszewski on 03/11/15.
//  Copyright © 2015 Netguru. All rights reserved.
//

#import "NGWRootViewController.h"

#import "NGWMapViewController.h"
#import "NGWLocationsListViewController.h"
#import "NGWAPIClient.h"
#import "NGWLocationRetriever.h"

@import PureLayout;

@interface NGWRootViewController() <NGWMapViewControllerDelegate, UITextFieldDelegate>
@property (assign, nonatomic) BOOL didSetConstraints;
@property (strong, nonatomic, nonnull) NGWMapViewController *mapVc;
@property (strong, nonatomic, nonnull) NGWLocationsListViewController *locationsListVc;
@property (strong, nonatomic, nonnull) NGWAPIClient *apiClient;
@property (strong, nonatomic, nonnull) NGWLocationRetriever *locationRetriever;

@end

@implementation NGWRootViewController

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        _locationRetriever = [NGWLocationRetriever new];
    }
    return self;
}

- (void)loadView {
    self.view = [UIView new];
}

- (void)configureView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _mapVc = [NGWMapViewController new];
    _mapVc.delegate = self;
    _locationsListVc = [NGWLocationsListViewController new];
    
    [self addChildViewController:self.mapVc];
    [self.view addSubview:self.mapVc.view];
    [self.mapVc didMoveToParentViewController:self];
    
    [self addChildViewController:self.locationsListVc];
    [self.view addSubview:self.locationsListVc.view];
    [self.locationsListVc didMoveToParentViewController:self];
}

- (void) configureNavigationItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"filter-icon"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Locate me!", nil) style:UIBarButtonItemStylePlain target:self action:@selector(locateMeBarButtonDidTap:)];
    UITextField *textField = [[UITextField alloc] initForAutoLayout];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    [textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:60.0f];
    [textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:120.0f];
    [textField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self configureNavigationItem];
    self.apiClient = [[NGWAPIClient alloc] initWithClientIdentifier:@"OJS3S0YKZRAD3KWCZ4XFU5NHNZOBDR2SGFPGV50MMERJKSED" clientSecret:@"ZWO5GWQ55ZF1CQ1ZMPPQSQISOENCPTUBMNSZDAUXAT0NBVQE"];
}

#pragma mark - Layout

- (void)updateViewConstraints {
    
    if (!self.didSetConstraints) {
        [self.mapVc.view autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.mapVc.view autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.mapVc.view autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.mapVc.view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view withMultiplier:0.33];
        
        [self.locationsListVc.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.mapVc.view];
        [self.locationsListVc.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        
        self.didSetConstraints = YES;
    }
    
    [super updateViewConstraints];
}

#pragma mark - Private

- (UITextField*) searchTextField {
    if (![self.navigationItem.titleView isKindOfClass:[UITextField class]]) {
        return nil;
    }
    return (UITextField*) self.navigationItem.titleView;
}

#pragma mark - Handling location update

- (void)updateListForLocation:(nonnull CLLocation *)location query:(NSString*)query {
    [self.apiClient getVenuesNearCoordinate:location.coordinate radius:kCLLocationAccuracyKilometer query:query categories:nil completion:^(NSArray<NGWVenue *> * _Nullable venues, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.locationsListVc updateCollectionWithItems:venues];
        });
    }];
}

- (void)locateMeBarButtonDidTap:(UIBarButtonItem *)button {
    [self.locationRetriever obtainUserLocationWithCompletion:^(CLLocation * _Nullable location, NSError * _Nullable error) {
        NSLog(@"%.4f, %.4f", location.coordinate.latitude, location.coordinate.latitude);
        [self.mapVc setCenterCoordinate:location.coordinate animated:YES];
        [self updateListForLocation:location query:[self searchTextField].text];
    }];
}

#pragma mark - NGWMapViewControllerDelegate

- (void)mapViewController:(NGWMapViewController *)controller didChangeToLocation:(nonnull CLLocation *)location {
    [self updateListForLocation:location query:[self searchTextField].text];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.locationRetriever obtainUserLocationWithCompletion:^(CLLocation * _Nullable location, NSError * _Nullable error) {
        NSLog(@"%.4f, %.4f", location.coordinate.latitude, location.coordinate.latitude);
        [self.mapVc setCenterCoordinate:location.coordinate animated:YES];
        [self updateListForLocation:location query:textField.text];
    }];
    return NO;
}
@end

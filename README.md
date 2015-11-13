# iOS Workshops App

This is the app you'll be using during Netguru's workshops. General idea of the application is to display a list of venues using Foursquare API. We know this file is too long to read but it's really worth it :smile:

## Setting up your development environment

- `gem install cocoapods`
- `pod install`

## Pod Dependencies

  * [PureLayout][purelayout]
  * [SLCoreDataStack][slcoredatastack]
  * [Specta][specta]
  * [Expecta][expecta]
  * [OCMock][ocmock]
  * [OHHTTPStubs][stubs]

  [purelayout]: https://github.com/PureLayout/PureLayout
  [slcoredatastack]: https://github.com/OliverLetterer/SLCoreDataStack
  [specta]: https://github.com/specta/specta
  [expecta]: https://github.com/specta/expecta
  [ocmock]: https://github.com/erikdoe/ocmock
  [stubs]: https://github.com/AliSoftware/OHHTTPStubs

## Supported iOS Versions

* iOS 9.0+

## Supported devices

* iPhone 4S, 5, 5S, 6, 6 Plus, 6S, 6S Plus

## What you should do to qualify for the workshops

* do not fork the repository - **clone it**,
* all tests should pass,
* fill missing method implementations,
* you should fix any bugs that you find in the current code base,
* implement missing functionality described below.

## Missing functionality

1. Add *UITextField* in Navigation Bar and implement search functionality:
 * after pressing Done on keyboard the list of venues should contain search results. To achieve this consult foursquare API documentation and `NGWAPIClient` class.
2. Add *UICollectionViewCell* subclass to display cells. Subclass should handle displaying *NGWVenue* items:
 * name,
 * *UIImageView* as background.
3. Add *UIViewController* subclass that displays a list of categories with following items:
 * category image,
 * category name.

 User after selecting such category should only see a list of venues that match only that category. Please connect that feature with right bar button.

## What disqualifies your application

* tests are not passing,
* your repo was forked from the original one,
* you've added a new dependency,
* you've used a Storyboard file.

## Additional informations
* write informative commit messages - take a look at short [styleguide](http://chris.beams.io/posts/git-commit/).
* please conform to [objective-c style guide](https://github.com/raywenderlich/objective-c-style-guide)

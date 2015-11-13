#
#  Podfile
#
#  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
#

# Pod sources
source 'https://github.com/CocoaPods/Specs.git'

# Initial configuration
inhibit_all_warnings!
use_frameworks!
xcodeproj 'ios-workshops'

# Main Target pods:
target :'ios-workshops' do
  pod 'PureLayout', '~> 3.0'
  pod 'SLCoreDataStack', '~> 1.0'
end

# Exclusive test dependencies
target 'ios-workshopsTests' do
  pod 'Expecta', '~> 1.0.1'
  pod 'Specta', '~> 1.0.5'
  pod 'OCMock', '~> 3.1.2'
  pod 'OHHTTPStubs', '~> 4.0.2'
end

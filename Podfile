workspace 'OsheagaGo.xcworkspace'
platform :ios, '14.0'

project 'OsheagaGo/OsheagaGo.xcodeproj'
project 'OsheagaKit/OsheagaKit.xcodeproj'

use_frameworks!
inhibit_all_warnings!

target :OsheagaGo do
  project 'OsheagaGo/OsheagaGo.xcodeproj'
  pod 'SDWebImageSwiftUI'
end

target :OsheagaKit do
  project 'OsheagaKit/OsheagaKit.xcodeproj'
end

plugin 'cocoapods-keys',
       project: 'OsheagaKit',
       keys: [
         'BusbudToken'
       ]

workspace 'OsheagaGo.xcworkspace'
project 'OsheagaGo/OsheagaGo.xcodeproj'

platform :ios, '14.0'
use_frameworks!
inhibit_all_warnings!

target 'OsheagaGo' do
  project 'OsheagaGo/OsheagaGo.xcodeproj'

  pod 'SDWebImageSwiftUI'
  pod 'lottie-ios'

  target 'SnapshotTests' do
    inherit! :search_paths

    pod 'SnapshotTesting'
  end
end

target 'OsheagaKit' do
  target 'OsheagaKitTests' do
    inherit! :search_paths
  end
end

plugin 'cocoapods-keys',
       project: 'OsheagaGo',
       target: 'OsheagaKit',
       keys: [
         'BusbudToken'
       ]

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

# Uncomment the next line to define a global platform for your projec
platform :ios, '14.5'

target 'DemoApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DemoApp

pod 'SwiftLint'
pod 'Alamofire', '~> 4.0'
pod 'SwiftFormat/CLI'
pod "PromiseKit", "~> 6.0"
pod "PromiseKit/CoreLocation"
pod "PromiseKit/MapKit"
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

end

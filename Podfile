source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'kirekawa' do

  pod 'Alamofire'
  pod 'SwiftyJSON'

  # Pods for kirekawa

  target 'kirekawaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'kirekawaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      configuration.build_settings['SWIFT_VERSION'] = "3.0"
    end
  end

end

end

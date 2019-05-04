# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'KakaobankTest' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxCocoa', '~> 4.5.0'
  pod 'RxSwift', '~> 4.5.0'
  pod 'RxDataSources'
  pod 'RxGesture', '~> 2.2.0'
  pod 'RxKeyboard'
  pod 'RealmSwift'
  pod 'SwiftyJSON'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end

  # Pods for KakaobankTest

  target 'KakaobankTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'KakaobankTestUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

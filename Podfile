# Uncomment this line to define a global platform for your project
# platform :ios, '10.0'

target 'Weatherly' do
  use_frameworks!

  # Pods for Weatherly
  pod 'Alamofire', '~> 4.0'
  pod 'ScrollableGraphView'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
           config.build_settings['SWIFT_VERSION'] = '3.0'
        end
   end
end

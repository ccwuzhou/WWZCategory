#
# Be sure to run `pod lib lint WWZCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WWZCategory'
  s.version          = '1.0.1'
  s.summary          = 'A short description of WWZCategory.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ccwuzhou/WWZCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ccwuzhou' => 'ccwuzhou@163.com' }
  s.source           = { :git => 'https://github.com/ccwuzhou/WWZCategory.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

s.source_files = 'WWZCategory/Classes/*.{h,m}'
  
  # s.resource_bundles = {
  #   'WWZCategory' => ['WWZCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

#
# Be sure to run `pod lib lint SwiftDictionaryCoding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftDictionaryCoding'
  s.version          = '1.0.0'
  s.summary          = 'Decode / encode dictionaries.'
  s.description      = 'Decode / encode instances of Decodable/Encodable objects to / from dictionaries'
  s.swift_version    = '4.1'

  s.homepage         = 'https://github.com/ashleymills/SwiftDictionaryCoding'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ashleymills' => 'ashleymills@mac.com' }
  s.source           = { :git => 'https://github.com/ashleymills/SwiftDictionaryCoding.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'
  s.source_files = 'SwiftDictionaryCoding/Classes/**/*'
  
end

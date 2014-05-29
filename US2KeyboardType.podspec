Pod::Spec.new do |s|
  s.name     = 'US2KeyboardType'
  s.version  = '1.0.0'
  s.summary  = 'US2KeyboardType is a category on UIApplication to determine the current UIKeyboardType state of the keyboard'
  s.description = <<-DESC
                    US2KeyboardType is a category on UIApplication to determine the current UIKeyboardType state of the keyboard
                  DESC
  s.homepage = 'https://github.com/ustwo/US2KeyboardType'
  s.license  = 'MIT'
  s.author   = { 'Martin Stolz' => 'martin@ustwo.com' }
  s.social_media_url = 'https://twitter.com/ustwo'
  s.ios.deployment_target = '7.0'
  s.source   = { :git => 'https://github.com/ustwo/US2KeyboardType.git', :tag => 'v1.0.0' }
  s.source_files = 'US2KeyboardType/UIApplication+US2KeyboardType.h', 'US2KeyboardType/UIApplication+US2KeyboardType.m'
  s.public_header_files = 'US2KeyboardType/UIApplication+US2KeyboardType.h'
  s.requires_arc = true
end
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_google_gemini_darwin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_google_gemini_darwin'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.ios.dependency 'Flutter'
  s.ios.dependency 'GoogleGenerativeAI', '~> 0.4.8'
  s.osx.dependency 'FlutterMacOS'
  s.osx.dependency 'GoogleGenerativeAI', '~> 0.4.8'
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.14'
  s.static_framework = true
  
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end

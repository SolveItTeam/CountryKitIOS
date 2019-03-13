#
# Be sure to run `pod lib lint CountryKitIOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'CountryKitIOS'
    s.version          = '1.3.0'
    s.summary          = 'Simple framework to get current country info'
    s.homepage         = 'https://github.com/SolveItTeam/CountryKitIOS.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ios dev' => 'vorobyev.semyon@gmail.com' }
    s.source           = { :git => 'https://github.com/SolveItTeam/CountryKitIOS.git', :tag => s.version.to_s }
    s.ios.deployment_target = '10.0'
    s.source_files = 'CountryKitIOS/Classes/**/*'
    s.resources = 'CountryKitIOS/**/*.json'
    s.resource_bundles = {
        'CountryKitIOS' => ['CountryKitIOS/Resources/*.json']
    }
    s.swift_version = '4.2'
    s.frameworks = 'CoreTelephony'
end

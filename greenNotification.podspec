#
# Be sure to run `pod lib lint greenNotification.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'greenNotification'
  s.version          = '0.1.2'
  s.summary          = 'Show custom popups easy and quick in new window'

# This description is used to generate tags and improve search results.
#   * Do yout need quick present popup notification?
#   * You can use this library for show popup with title, text, image and buttons
#   * Or you can show with animation your custom UIView from XIB file


  s.description      = "Do yout need quick present popup notification? You can use this library for show popup with title, text, image and buttons. Or you can show with animation your custom UIView from XIB file"

  s.homepage         = 'https://github.com/NBibikov/greenNotification'
  s.screenshots     = 'https://raw.githubusercontent.com/NBibikov/greenNotification/master/greenPopUPNotification.jpg'
  s.license          = "MIT"
  s.author           = { 'Nick Bibikov' => 'n.bibikov@me.com' }
  s.source           = { :git => 'https://github.com/NBibikov/greenNotification.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/nbibikov'

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
  s.source_files = 'greenNotification/Classes/**/*'

end

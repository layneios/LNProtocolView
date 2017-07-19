#
# Be sure to run `pod lib lint LNProtocolView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = 'LNProtocolView'
  s.version          = '0.1.0'
  s.summary          = 'A light weight protocol view.'
  s.description      = 'A light weight protocol view.'
  s.homepage         = 'https://github.com/lengmolehongyan/LNProtocolView'
  s.screenshots      = 'http://ac-HSNl7zbI.clouddn.com/QAk1VHlWtxtb6zQR976G1B2Y2ggIDT9OniydzXk3.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lengmolehongyan' => 'lengmohongyan@hotmail.com' }
  s.source           = { :git => 'https://github.com/lengmolehongyan/LNProtocolView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'LNProtocolView/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

end

Pod::Spec.new do |s|
  s.name             = 'YTDropDownButton'
  s.version          = '1.0.0'
  s.summary          = 'YTDropDownButton is a drop down button! '
  s.homepage         = 'https://github.com/yigit26/YTDropDownButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yigit Can Ture' => 'yigit.ture@gmail.com' }
  s.source           = { :git => 'https://github.com/yigit26/YTDropDownButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'YTDropDownButton/YTDropDownButton/Sources/**/*.{swift}'
  s.module_name  = 'YTDropDownButton'
  s.requires_arc = true
  s.platform     = :ios, '9.0'
end

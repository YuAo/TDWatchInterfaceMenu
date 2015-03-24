Pod::Spec.new do |s|
  s.name         = 'TDWatchInterfaceMenu'
  s.version      = '1.2'
  s.summary      = "Add menu item with a block as it's action handler to `WKInterfaceController`"
  s.homepage     = "https://github.com/YuAo/TDWatchInterfaceMenu"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'YuAo' => 'me@imyuao.com' }
  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.source_files = 'TDWatchInterfaceMenu/*.{h,m}'
  s.source       = { :git => "https://github.com/YuAo/TDWatchInterfaceMenu.git", :tag => "1.2" }
end

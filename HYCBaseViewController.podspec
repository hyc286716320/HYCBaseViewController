
Pod::Spec.new do |s|
s.name     = 'HYCBaseViewController'
s.version  = '1.1' 
s.license  = "MIT"
s.summary  = 'UIViewController父类,能快速实现UINav的一些设置,非常实用' 
s.homepage = 'https://github.com/hyc286716320/HYCBaseViewController'
s.author   = {'HuYunchao' => 'hyc286716320'} 
s.source   = { :git => 'https://github.com/hyc286716320/HYCBaseViewController.git', :tag =>s.version} 
s.platform     = :ios 
s.source_files = 'HYCBaseViewController'
s.requires_arc = true

#s.dependency 'TMUtils', '~> 1.0'
end

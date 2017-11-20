Pod::Spec.new do |s|

  s.name         = "HYCBaseViewController"
  s.version      = "0.0.1"
  s.summary      = "Super ViewController"
  s.description  = "this is Super ViewController"
  s.homepage     = "https://github.com/hyc286716320/HYCBaseViewController"
  s.license      = "MIT"
  s.author             = { "HuYunchao" => "286716320@qq.com" }
  s.source       = { :git => "https://github.com/hyc286716320/HYCBaseViewController.git", :tag => "#{s.version}" }
  s.source_files  = "HYCBaseViewController", HYCBaseViewController/*.{h,m}"
#  s.exclude_files = "Classes/Exclude"
end

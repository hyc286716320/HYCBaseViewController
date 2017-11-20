#
#  Be sure to run `pod spec lint HYCBaseViewController.podpec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HYCBaseViewController"
  s.version      = "0.0.1"
  s.summary      = "这是一首简单的小情歌"
  s.homepage     = "https://github.com/hyc286716320/HYCBaseViewController"
  s.license      = "MIT (example)"
  s.author             = { "HuYunchao" => "286716320@qq.com" }
  s.platform     = :iOS , '6.0'
  s.source       = { :git => "http://EXAMPLE/HYCBaseViewController.podpec.git", :tag => "#{s.version}" }




  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_files = true
  s.exclude_files = "Classes/Exclude"

end

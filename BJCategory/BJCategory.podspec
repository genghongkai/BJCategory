Pod::Spec.new do |s|
  s.name         = "BJCategory"
  s.version      = "0.2.0"
  s.summary      = "完善BJCategory分类"
  s.description  = <<-DESC 
                          完善BJCategory分类,增加了扩展类。
                   DESC
  s.homepage     = "https://github.com/genghongkai/BJCategory"
  s.license      = { :type => "MIT",}
  s.author       = { "genghongkai" => "1159538747@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/genghongkai/BJCategory.git", :tag => "0.2.0" }
  s.source_files  = "BJCategory", "BJCategory/BJCategories/**/*.{h,m}"
  s.framework  = "UIKit"
end
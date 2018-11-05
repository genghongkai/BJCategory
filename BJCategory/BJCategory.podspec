Pod::Spec.new do |s|
  s.name         = "BJCategory"
  s.version      = "0.2.3"
  s.summary      = "完善BJCategory分类"
  s.description  = <<-DESC 
                          1、修改输出日志方式。2、添加了懒加载初始化和自定义懒加载初始化。
                   DESC
  s.homepage     = "https://github.com/genghongkai/BJCategory"
  s.license      = { :type => "MIT",}
  s.author       = { "genghongkai" => "1159538747@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/genghongkai/BJCategory.git", :tag => "0.2.3" }
  s.source_files  = "BJCategory", "BJCategory/BJCategories/**/*.{h,m}"
  s.framework  = "UIKit"
end
Pod::Spec.new do |s|
  s.name         = "BJCategory"
  s.version      = "0.1.2"
  s.summary      = "完善BJCategory分类(增加了找一个类(kvc)的key)"
  s.description  = <<-DESC 
                          完善BJCategory分类,增加了找一个类(kvc)的key，在项目中找子视图的key。
                   DESC
  s.homepage     = "https://github.com/genghongkai/BJCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "genghongkai" => "1159538747@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/genghongkai/BJCategory.git", :tag => "0.1.2" }
  s.source_files  = "BJCategory", "BJCategory/BJCategories/**/*.{h,m}"
  s.framework  = "UIKit"
end
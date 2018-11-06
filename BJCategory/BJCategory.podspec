Pod::Spec.new do |s|
  s.name         = "BJCategory"
  s.version      = "0.2.4"
  s.summary      = "完善BJCategory分类"
  s.description  = <<-DESC 
                          修改0.2.3提交时，遗漏方法补充更新。
                   DESC
  s.homepage     = "https://github.com/genghongkai/BJCategory"
  s.license      = { :type => "MIT",}
  s.author       = { "genghongkai" => "1159538747@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/genghongkai/BJCategory.git", :tag => "0.2.4" }
  s.source_files  = "BJCategory", "BJCategory/BJCategories/**/*.{h,m}"
  s.framework  = "UIKit"
end
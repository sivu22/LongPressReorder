Pod::Spec.new do |s|
  s.name             = 'LongPressReorder'
  s.version          = '1.0.1'
  s.summary          = 'Swift library that allows reordering of UITableView cells via long press gesture.'

  s.description      =
'LongPressReorder adresses a common use case when working with tables on an iOS device: the posibility to reorder table rows using a long press gesture, similar to drag and drop gesture. Lightweight and easy to use, LongPressReorder works with any view controller that manages an UITableView.'

  s.homepage         = 'https://github.com/sivu22/LongPressReorder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cristian Sava' => 'cristianzsava@gmail.com' }
  s.source           = { :git => 'https://github.com/sivu22/LongPressReorder.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'LongPressReorder/Classes/**/*'
end

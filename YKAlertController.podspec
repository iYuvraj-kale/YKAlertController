Pod::Spec.new do |s|
  s.name             = 'YKAlertController'
  s.version          = '0.1.0'
  s.summary          = 'This will help you to Show alert controller over any view controller.'

  s.description      = <<-DESC
You will get foresheet to select option!
                       DESC

  s.homepage         = 'https://github.com/iYuvraj-kale/YKAlertController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Yuvraj Kale>' => '<yuvrajkale99@gmail.com>' }
  s.source           = { :git => 'https://github.com/iYuvraj-kale/YKAlertController.git', :tag => s.version.to_s, :branch => "main" }

  s.ios.deployment_target = '10.0'
  s.source_files = 'AlertController/AlertController.swift'

end
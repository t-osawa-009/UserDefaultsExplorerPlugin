Pod::Spec.new do |spec|
  spec.name         = "UserDefaultsExplorerPlugin"
  spec.version      = "0.0.1"
  spec.summary      = "UserDefaultsExplorer Plugin"
  spec.homepage     = "https://github.com/t-osawa-009/UserDefaultsExplorerPlugin"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author             = { "t-osawa-009" => "da87435@gmail.com" }
  spec.source       = { :git => "https://github.com/t-osawa-009/UserDefaultsExplorerPlugin.git", :tag => "#{spec.version}" }
  spec.requires_arc          = true
  spec.ios.deployment_target     = '11.0'
  spec.source_files = "Sources/**/*.{swift}", "Sources/*.{swift,h}"
  spec.swift_version = '5.2'
end

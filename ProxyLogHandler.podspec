Pod::Spec.new do |s|
  s.name         = "ProxyLogHandler"
  s.version      = "1.0.1"
  s.author       = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "http://www.e-sites.nl"
  s.summary      = "Proxy swift-log handler"
  s.source       = { :git => "https://github.com/e-sites/swift-log-proxy.git", :tag => "v#{s.version}" }
  s.source_files  = "Sources/**/*.{h,swift}"
  s.platform     = :ios, '10.0'
  s.requires_arc = true
  s.dependency 'Logging'
  s.swift_versions = [ '5.2' ]
end

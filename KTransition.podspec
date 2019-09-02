Pod::Spec.new do |s|

s.name         = "KTransition"
s.version      = "1.0"
s.summary      = "iOS Custom transition library"
s.description  = <<-DESC
iOS Custom transition library
DESC
s.homepage     = "https://github.com/KenanAtmaca/KTransition"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "KenanAtmaca" => "mail.kenanatmaca@gmail.com" }
s.social_media_url   = "https://twitter.com/uikenan"

s.platform     = :ios, "11.0"
s.requires_arc = true
s.ios.deployment_target = "11.0"

s.source       = { :git => "https://github.com/KenanAtmaca/KTransition", :tag => "#{s.version}" }
s.source_files  = "KTransition", "KTransition/**/*.{h,m,swift}"
s.swift_version = '4.2'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2'}
end

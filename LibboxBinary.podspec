Pod::Spec.new do |s|
  s.name = "LibboxBinary"
  s.version = "1.14.4-fix.1"
  s.summary = "Prebuilt Libbox XCFramework for Apple platforms"
  s.description = <<-DESC
    Versioned prebuilt Libbox XCFramework used by ReactNativeSingbox and its
    Packet Tunnel extension.
  DESC

  s.homepage = "https://github.com/elysia-io-code/libbox-ios-binary"
  s.license = {
    :type => "GPL-3.0-or-later",
    :text => "GNU General Public License version 3 or later"
  }
  s.author = {
    "DeSaFa" => "2938563358@qq.com"
  }

  s.platform = :ios, "16.0"
  s.swift_version = "5.9"

  # Replace sha256 after regenerating dist/Libbox.xcframework.zip.
  s.source = {
    :http => "https://github.com/elysia-io-code/libbox-ios-binary/releases/download/1.14.4-fix.1/Libbox.xcframework.zip",
    :sha256 => "9ea3c70d11bf6d28da9038a3254c77a25946dd9555aa51967e6b6c3639517272"
  }

  s.vendored_frameworks = "Libbox.xcframework"
  s.frameworks = [
    "Foundation",
    "UIKit",
    "Network",
    "NetworkExtension",
    "SystemConfiguration",
    "CoreFoundation",
    "CoreGraphics",
    "CoreText",
    "CoreTelephony",
    "Security",
    "CFNetwork",
    "MobileCoreServices",
    "UniformTypeIdentifiers",
    "CryptoTokenKit",
    "LocalAuthentication"
  ]
  s.libraries = ["resolv", "c++"]
  s.requires_arc = true
end

Pod::Spec.new do |s|
  s.name = "LibboxBinary"
  s.version = "1.13.18"
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
    :http => "https://github.com/elysia-io-code/libbox-ios-binary/releases/download/1.13.18/Libbox.xcframework.zip",
    :sha256 => "004f5f20f785f32ddd64f5e01415d573197bc2b1a0a76e782f89d20be0421f28"
  }

  s.vendored_frameworks = "Libbox.xcframework"
  s.frameworks = [
    "Foundation",
    "Network",
    "NetworkExtension",
    "SystemConfiguration"
  ]
  s.libraries = "resolv"
  s.requires_arc = true
end

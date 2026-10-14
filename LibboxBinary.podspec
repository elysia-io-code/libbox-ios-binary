Pod::Spec.new do |s|
  s.name = "LibboxBinary"
  s.version = "1.14.3"
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
    :http => "https://github.com/elysia-io-code/libbox-ios-binary/releases/download/1.14.3/Libbox.xcframework.zip",
    :sha256 => "e0929cee8885c94d1687b0e147c8ce4bb20bd32982e3aef8a004daca0e2c304d"
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

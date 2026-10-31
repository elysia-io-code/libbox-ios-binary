# LibboxBinary

Versioned prebuilt Libbox XCFramework for Apple platforms.

This repository contains the CocoaPods specification and release metadata for
the Libbox binary used by `@desafa/react-native-singbox`. The XCFramework is
distributed through GitHub Releases and is not committed to this Git
repository.

## Current release

- Pod name: `LibboxBinary`
- Libbox version: `1.14.4`
- Minimum iOS version: `16.0`
- Device architecture: `arm64`
- Simulator architectures: `arm64`, `x86_64`
- Included slices: iOS only (no macOS/tvOS)
- Naive outbound and Cronet support retained

The binary is mirrored without modification from
[`benisonchan/sing-box` v1.14.4-fix.1](https://github.com/benisonchan/sing-box/releases/tag/v1.14.4-fix.1),
source commit `7ff8f3a9e02e8933d51bf3f1d76062bb61c2451c`. The upstream
Cronet compatibility implementation retains the disabled TimerSlack optimization.
All three iOS architecture links have been checked; physical-device VPN runtime
validation remains separate. CocoaPods declares the required system frameworks
and libraries. Manual Xcode integrations must also use `-ObjC` and the dependencies
listed in `LibboxBinary.podspec`.

## CocoaPods

Add this private Specs source before the CocoaPods CDN:

```ruby
source "https://github.com/elysia-io-code/libbox-ios-binary.git"
source "https://cdn.cocoapods.org/"
```

Install the binary Pod:

```ruby
pod "LibboxBinary", "1.14.4"
```

## Release process

1. Build `Libbox.xcframework` with matching device and simulator slices.
2. Create a fresh `dist/Libbox.xcframework.zip` without `.DS_Store`, `__MACOSX`,
   or AppleDouble (`._*`) files, preserving framework symlinks:

   ```sh
   # Run from the directory containing the new Libbox.xcframework.
   # Use a new output path so zip cannot retain files from an older archive.
   COPYFILE_DISABLE=1 zip -q -r -y /tmp/Libbox-1.14.4.xcframework.zip Libbox.xcframework \
     -x '__MACOS*' '*/__MACOS*' '.DS_Store' '*/.DS_Store' '._*' '*/._*'
   # Move the completed archive to this repository's dist/Libbox.xcframework.zip.
   ```
3. Calculate the archive SHA-256 checksum.
4. Update `LibboxBinary.podspec` and the versioned JSON spec with that checksum.
5. Create a GitHub Release tagged `1.14.4`.
6. Upload `dist/Libbox.xcframework.zip` as the Release Asset.
7. Validate the Podspec against the uploaded asset.
8. Publish the versioned spec to the private Specs repository.

The release asset URL expected by version `1.14.4` is:

```text
https://github.com/elysia-io-code/libbox-ios-binary/releases/download/1.14.4/Libbox.xcframework.zip
```

## Validate locally

Before the GitHub Release exists, validate the metadata conversion:

```sh
pod ipc spec LibboxBinary.podspec
```

After uploading the Release Asset, validate the complete binary Pod:

```sh
pod spec lint LibboxBinary.podspec --allow-warnings --verbose
```

For a private Specs repository, publish with:

```sh
pod repo push desafa-binary-specs LibboxBinary.podspec \
  --allow-warnings \
  --verbose
```

## Checksum maintenance

The checksum is duplicated in these files and must be updated whenever the ZIP
changes:

- `LibboxBinary.podspec`
- `Specs/LibboxBinary/1.14.4/LibboxBinary.podspec.json`

Generate the checksum with:

```sh
shasum -a 256 dist/Libbox.xcframework.zip
```

## License

The distributed Libbox binary is derived from SagerNet sing-box and
sing-box-for-apple.

- Upstream: https://github.com/SagerNet/sing-box
- Apple project: https://github.com/SagerNet/sing-box-for-apple
- License: GNU General Public License version 3 or later

See the upstream projects for complete license and copyright information.

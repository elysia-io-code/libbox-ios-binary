# LibboxBinary

Versioned prebuilt Libbox XCFramework for Apple platforms.

This repository contains the CocoaPods specification and release metadata for
the Libbox binary used by `@desafa/react-native-singbox`. The XCFramework is
distributed through GitHub Releases and is not committed to this Git
repository.

## Current release

- Pod name: `LibboxBinary`
- Libbox version: `1.13.18`
- Minimum iOS version: `16.0`
- Device architecture: `arm64`
- Simulator architectures: `arm64`, `x86_64`

## CocoaPods

Add this private Specs source before the CocoaPods CDN:

```ruby
source "https://github.com/elysia-io-code/libbox-ios-binary.git"
source "https://cdn.cocoapods.org/"
```

Install the binary Pod:

```ruby
pod "LibboxBinary", "1.13.18"
```

## Release process

1. Build `Libbox.xcframework` with matching device and simulator slices.
2. Create `dist/Libbox.xcframework.zip` without `.DS_Store` or `__MACOSX`.
3. Calculate the archive SHA-256 checksum.
4. Update `LibboxBinary.podspec` and the versioned JSON spec with that checksum.
5. Create a GitHub Release tagged `1.13.18`.
6. Upload `dist/Libbox.xcframework.zip` as the Release Asset.
7. Validate the Podspec against the uploaded asset.
8. Publish the versioned spec to the private Specs repository.

The release asset URL expected by version `1.13.18` is:

```text
https://github.com/elysia-io-code/libbox-ios-binary/releases/download/1.13.18/Libbox.xcframework.zip
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
- `Specs/LibboxBinary/1.13.18/LibboxBinary.podspec.json`

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

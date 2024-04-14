# ios-hw-to-os SPM package

This is the Swift Package Manager package for [ios-hw-to-os](https://github.com/bes/ios-hw-to-os).

Please see the main project for more information.

## How to use

Add `https://github.com/bes/ios-hw-to-os-spm` to either your own Swift package,
or in XCode under "Package Dependencies".

Once you have added the package as a dependency, you can use it like so:

```swift
import IosHwToOs

func useAllMappings() {
    guard let mappings = IosHwToOsMappings.all() else {
        return
    }
    guard let device = mappings.devices.first(where: { $0.hardware == "iPhone10,1"}) else {
        return
    }
    // Prints IosHwToOsDevice(hardware: "iPhone10,1", version: "16.7.7")
    print("\(device)")
}

func useOneDevice() {
    guard let device = IosHwToOsDevice.get(hardware: "iPhone10,1") else {
        return
    }
    // Prints IosHwToOsDevice(hardware: "iPhone10,1", version: "16.7.7")
    print("\(device)")
}
```

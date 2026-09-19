import Foundation

private let cache: IosHwToOsMappings? = {
    guard let mappingsUrl = Bundle.module.url(forResource: "mappings", withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: mappingsUrl)
        let decoder = JSONDecoder()
        return try decoder.decode(IosHwToOsMappings.self, from: data)
    } catch {
        return nil
    }
}()

public struct IosHwToOsMappings: Codable, Sendable {
    public var devices: [IosHwToOsDevice]
    public var highestVersion: String

    public static func all() -> IosHwToOsMappings? {
        return cache
    }

    public static func highestAvailableVersion() -> String? {
        guard let mappings = IosHwToOsMappings.all() else {
            return nil
        }
        return mappings.highestVersion
    }
}

public struct IosHwToOsDevice: Codable, Sendable {
    public var hardware: String
    public var version: String

    public static func get(hardware: String) -> IosHwToOsDevice? {
        guard let mappings = IosHwToOsMappings.all() else {
            return nil
        }
        return mappings.devices.first { $0.hardware == hardware }
    }
}

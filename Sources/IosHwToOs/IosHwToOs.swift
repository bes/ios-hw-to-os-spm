import Foundation

private var cache: IosHwToOsMappings?

public struct IosHwToOsMappings: Codable {
    public var devices: [IosHwToOsDevice]
    
    public static func all() -> IosHwToOsMappings? {
        if let cache {
            return cache
        }
        guard let mappingsUrl = Bundle.module.url(forResource: "mappings", withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: mappingsUrl)
            let decoder = JSONDecoder()
            let mappings = try decoder.decode(IosHwToOsMappings.self, from: data)
            cache = mappings
            return mappings
        } catch {
            return nil
        }
    }
}

public struct IosHwToOsDevice: Codable {
    public var hardware: String
    public var version: String
    
    public static func get(hardware: String) -> IosHwToOsDevice? {
        guard let mappings = IosHwToOsMappings.all() else {
            return nil
        }
        return mappings.devices.first { $0.hardware == hardware }
    }
}

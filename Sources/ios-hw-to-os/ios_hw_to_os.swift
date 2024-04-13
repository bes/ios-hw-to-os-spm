import Foundation

public struct Mappings: Codable {
    public var devices: [Device]
}

public struct Device: Codable {
    public var hardware: String
    public var version: String
}

public func readMappings() -> Mappings? {
    guard let mappingsUrl = Bundle.module.url(forResource: "mappings", withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: mappingsUrl)
        let decoder = JSONDecoder()
        let mappings = try decoder.decode(Mappings.self, from: data)
        return mappings
    } catch {
        return nil
    }
}

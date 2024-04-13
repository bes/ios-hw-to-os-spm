import XCTest
@testable import ios_hw_to_os

final class ios_hw_to_osTests: XCTestCase {
    func testDevice() throws {
        guard let mappings = readMappings() else {
            XCTAssert(false)
            return
        }
        // This device will never get a new iOS version
        guard let device = mappings.devices.first(where: { $0.hardware == "iPhone10,1"}) else {
            XCTAssert(false)
            return
        }
        // This device will always be on this iOS version
        XCTAssertEqual(device.version, "16.7.7")
    }
}

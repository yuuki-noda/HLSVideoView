@testable import HLSVideoView
import XCTest

final class HLSVideoViewTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let view = HLSVideoView()
        XCTAssertFalse(view.play(urlString: ""))
        XCTAssertTrue(view.play(urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8"))
    }
}

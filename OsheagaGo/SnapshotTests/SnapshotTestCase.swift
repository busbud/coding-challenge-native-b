//
//  Copyright © 2020 OsheagaGo. All rights reserved.
//

import Foundation
import SwiftUI
import XCTest
import SnapshotTesting

typealias SnapshotDevices = [String: Snapshotting<UIViewController, UIImage>]

extension SnapshotDevices {

    static let devices: Self = [
        "iPhoneSE": .image(on: .iPhone8),
        "iPhoneXsMax": .image(on: .iPhoneXsMax),
        "iPhoneX": .image(on: .iPhoneX),
        "iPadPro11Landscape": .image(on: .iPadPro11),
        "iPadPro11Portrait": .image(on: .iPadPro11(.portrait)),
        "iPadMiniLandscape": .image(on: .iPadMini),
        "iPadMiniPortrait": .image(on: .iPadMini(.portrait))
    ]
}

extension Date {
    static let homepage: Self = Date(timeIntervalSince1970: 1_603_108_800)
}

open class SnapshotTestCase: XCTestCase {

    var devices: SnapshotDevices!
    var calendar: Calendar!

    open override func setUp() {
        super.setUp()
        devices = [:]
        calendar = Calendar(identifier: .iso8601)
//        isRecording = true // Uncomment this line to re-record all snapshot tests.
    }

    open override func tearDown() {
        devices = nil
        calendar = nil
        super.tearDown()
    }

    func dateFromToday(days: Int) -> Date {
        guard let date = calendar.date(byAdding: DateComponents(calendar: calendar, day: days), to: .homepage) else {
            XCTFail("Unable to create specified date \(days) days from \(Date.homepage)")
            return .homepage
        }
        return date
    }

    func assert<V: View>(_ view: V, devices: SnapshotDevices = .devices, testName: String = #function, file: StaticString = #file, line: UInt = #line) {
        ColorScheme.allCases.forEach { colorScheme in
            devices.forEach { (key: String, value: Snapshotting<UIViewController, UIImage>) in
                assertSnapshot(matching: view.environment(\.colorScheme, colorScheme).asViewController, as: value, named: "\(key)-\(colorScheme.description)", file: file, testName: testName, line: line)
            }
        }
    }

    func assertNoDevice<V: View>(_ view: V, testName: String = #function, file: StaticString = #file, line: UInt = #line) {
        assertSnapshot(matching: view.asViewController, as: .image(), named: "List", file: file, testName: testName, line: line)
    }
}

private extension ColorScheme {
    var description: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        @unknown default:
            fatalError()
        }
    }
}

private extension View {

    var asViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}

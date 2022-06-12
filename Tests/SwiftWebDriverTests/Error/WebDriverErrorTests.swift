//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/06.
//

import XCTest
@testable import SwiftWebDriver

class WebDriverErrorTests: XCTestCase {
    
    func testErrorSessionIdisNilMessage() {
        let error = WebDriverError.sessionIdisNil
        let localizedDescription = error.localizedDescription
        let expectLocalizedDescription = "session id must not be nil"
        XCTAssertEqual(localizedDescription, expectLocalizedDescription)
    }
}

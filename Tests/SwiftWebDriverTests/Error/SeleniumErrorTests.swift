//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/06.
//

import XCTest
@testable import SwiftWebDriver

class SeleniumErrorTests: XCTestCase {
    
    let expectMessage = "expectMessage"
    let expectError = "expectError"
    
    func testErrorMessage() {
        
        let error = SeleniumError(
            value: SeleniumError.Value(
                message: expectMessage,
                error: expectError
            )
        )
        
        let localizedDescription = error.localizedDescription
        let expectLocalizedDescription = "error : \(expectError), message: \(expectMessage)"
        XCTAssertEqual(localizedDescription, expectLocalizedDescription)
    }
}

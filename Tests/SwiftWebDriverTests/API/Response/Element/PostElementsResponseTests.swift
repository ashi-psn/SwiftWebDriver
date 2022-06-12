//
//  PostElementsResponseTests.swift
//  
//
//  Created by ashizawa on 2022/06/07.
//

import XCTest
@testable import SwiftWebDriver

class PostElementsResponseTests: XCTestCase {
    
    let json = """
{
    "value": [
        {
            "element-6066-11e4-a52e-4f735466cecf": "value1"
        },
        {
            "element-6066-11e4-a52e-4fdfasafsadf": "value2"
        }
    ]
}
"""

    func testDecode() throws {
        let decoder = JSONDecoder()
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        let value = try decoder.decode(PostElementsResponse.self, from: data)
        XCTAssertEqual(value.value.count, 2)
        XCTAssertEqual(value.value[0], "value1")
        XCTAssertEqual(value.value[1], "value2")
    }
}

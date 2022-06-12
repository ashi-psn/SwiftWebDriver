//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/03.
//

import XCTest
@testable import SwiftWebDriver

class APIClientTests: XCTestCase {

    func testNewSessionRequest() throws {
        
//        let chromeOption = ChromeOptions(
//            args: [
//                .init(args: .headless),
//                "sfasa",
//            ]
//        )
//
//        let driver = WebDriver(with: try ChromeDriver(stableObject: chromeOption))
//        let expection = expectation(description: "http request expection")
//
//        let _ = APIClient.shared
//
//
//        let chromeOption = ChromeOptions(
//            args: [
//                .init(args: .headless),
//                "sfasa",
//            ]
//        )
//
//        let _ = WebDriver(browser: .chrome(options: chromeOption))
//        let reqeust = NewSessionRequest(chromeOptions: chromeOption)
//        APIClient.shared.request(reqeust).whenComplete { result in
//            switch result{
//            case .success(let response):
//                XCTAssertNotEqual(response.value.sessionId, "")
//
//            case .failure(let error):
//                XCTFail(error.localizedDescription)
//            }
//
//            expection.fulfill()
//        }
//
//        wait(for: [expection], timeout: 10.0)
    }
}

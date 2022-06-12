////
////  NewSessionRequestTests.swift
////
////
////  Created by ashizawa on 2022/06/02.
////
//
//import XCTest
//@testable import SwiftWebDriver
//
//class NewSessionRequestTests: XCTestCase {
//
//    func testAPIReqiest() throws {
//
////        let expection = expectation(description: "http request expection")
//
////        let client = APIClient.shared
//
//        let args: [Args] = [
//            .init(.headless)
//        ]
//
//        let chromeOption = ChromeOptions(args: args)
//
//        let request = NewSessionRequest(
//            baseURL: URL(string: "http://localhost:9515")!,
//            chromeOptions: chromeOption)
//
//        XCTAssertEqual(request.url.absoluteString, "http://localhost:9515/session")
//        XCTAssertEqual(request.chromeOptions.args, args)
//
////        client.request(request) { result in
////            switch result {
////            case .success(let response):
////                XCTAssertNotEqual(response.value.sessionId, "")
////                print(response.value.sessionId)
////            case .failure(let error):
////                XCTFail(error.localizedDescription)
////            }
////
////            expection.fulfill()
////        }
////
////        wait(for: [expection], timeout: 10.0)
//    }
//
//}

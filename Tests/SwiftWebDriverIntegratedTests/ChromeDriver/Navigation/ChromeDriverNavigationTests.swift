//
//  ChromeDriverNavigationTests.swift
//
//
//  Created by ashizawa on 2022/06/10.
//

import XCTest
@testable import SwiftWebDriver

class ChromeDriverNavigationTests: XCTestCase, WebPageTestable {
    
    
    var pageEndPoint: String = "awaitTestPage.html"

    let chromeOption = ChromeOptions(args: [
        Args(.headless),
    ])

    func testGetNavigationTitle() async {
        guard let url = URL(string: webDriverURL) else {
            XCTFail()
            return
        }

        let driver = WebDriver(
            driver: ChromeDriver(
                driverURL: url,
                browserObject: chromeOption
            )
        )

        defer {
            Task.detached {
                do {
                    try await driver.stop()
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
        }

        do {
            try await driver.start()
            try await driver.navigateTo(url: testPageURLString)
            let title = try await driver.navigationTitle()
            XCTAssertNotNil(title.value)
            XCTAssertEqual(title.value, "expect title")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testWaitUntilElements() async {
        guard let url = URL(string: webDriverURL) else {
            XCTFail()
            return
        }

        let driver = WebDriver(
            driver: ChromeDriver(
                driverURL: url,
                browserObject: chromeOption
            )
        )

        defer {
            Task.detached {
                do {
                    try await driver.stop()
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
        }

        do {
            try await driver.start()
            try await driver.navigateTo(url: testPageURLString)

            try await driver
                .findElement(.css(.id("startButton")))
                .click()

            let result = try await driver
                .waitUntil(.css(.id("asyncAddElement")), retryCount: 5, durationSeconds: 1)

            XCTAssertTrue(result)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

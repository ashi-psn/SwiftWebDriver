//
//  ChromeDriverElmentHandleTests.swift
//
//
//  Created by ashizawa on 2022/06/10.
//

import XCTest
@testable import SwiftWebDriver

class ChromeDriverElmentHandleTests: XCTestCase, WebPageTestable {

    var pageEndPoint: String = "elementHandleTestPage.html"

    let chromeOption = ChromeOptions(args: [
        Args(.headless),
    ])

    func testClickButtton() async {
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

            let button = try await driver
                .findElement(.css(.id("button")))

            try await button.click()

            let text = try await button.text()
            XCTAssertEqual(text, "clicked!")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testElementAttribute() async {
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

            let inputElement = try await driver
                .findElement(.css(.id("attribute")))
            let attribute = try await inputElement.atttribute(name: "value")

            XCTAssertEqual(attribute, "expect attribute")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testElementClear() async {
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

            let inputElement = try await driver
                .findElement(.css(.id("clearInputValue")))

            try await inputElement.clear()

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testSendKey() async {
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
            try await driver.navigateTo(url: self.testPageURL)
            
            XCTAssertNoThrow {
                try await driver
                    .findElement(.css(.id("sendValue")))
                    .send(value: "newValue")
            }
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetScreenShot() async {
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

            let screenShot = try await driver.screenshot()
            let _ = screenShot.data(using: .utf8)
            XCTAssertNotNil(screenShot)

            let inputElement = try await driver
                .findElement(.css(.id("sendValue")))

            let elementScreenShot = try await inputElement.screenshot()
            let data = elementScreenShot.data(using: .utf8)

            XCTAssertNotNil(data)

        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

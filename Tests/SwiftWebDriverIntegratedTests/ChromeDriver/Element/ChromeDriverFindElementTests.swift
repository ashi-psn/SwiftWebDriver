//
//  ChromeDriverFindElementTests.swift
//
//
//  Created by ashizawa on 2022/06/10.
//

import XCTest
@testable import SwiftWebDriver

class ChromeDriverFindElementTests: XCTestCase, WebPageTestable {
    
    var pageEndPoint: String = "index.html"

    let chromeOption = try! ChromeOptions(args: [
        Args(.headless),
    ])

    func testGetElementCSSElement() async {
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
            try await driver.navigateTo(url: testPageURL)

            let classText = try await driver.findElement(.css(.class("classElement"))).text()
            XCTAssertEqual(classText, "classElement")

            let idElement = try await driver.findElement(.css(.id("idElement"))).text()
            XCTAssertEqual(idElement, "idElement")

            let nameElement = try await driver.findElement(.css(.name("nameElement"))).text()
            XCTAssertEqual(nameElement, "nameElement")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetElementByXPath() async {
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
            try await driver.navigateTo(url: testPageURL)

            let inParentSingleElement = try await driver.findElement(.xpath("//*[@id=\"inParentSingleElement\"]")).text()
            XCTAssertEqual(inParentSingleElement, "inParentSingleElement")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetElementByLinkText() async {
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
            try await driver.navigateTo(url: testPageURL)

            let text = try await driver
                .findElement(.linkText("go to next page"))
                .text()
            XCTAssertEqual(text, "go to next page")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetElementByParticalLink() async {
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
            try await driver.navigateTo(url: testPageURL)

            let text = try await driver
                .findElement(.particalLinkText("go"))
                .text()
            XCTAssertEqual(text, "go to next page")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testGetElementByTagName() async {
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
            try await driver.navigateTo(url: testPageURL)

            let text = try await driver
                .findElement(.tagName("h1"))
                .text()
            XCTAssertEqual(text, "this is h1")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

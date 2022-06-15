//
//  ChromeDriverFindElementsTests.swift
//
//
//  Created by ashizawa on 2022/06/10.
//

import XCTest
@testable import SwiftWebDriver

class ChromeDriverFindElementsTests: XCTestCase, WebPageTestable {
    
    var pageEndPoint: String = "findElementsTestPage.html"
    
    let chromeOption = try! ChromeOptions(args: [
        Args(.headless),
    ])
    
    func testGetElementsCSSElement() async {
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
            try await driver.navigateTo(urlString: testPageURLString)
            
            let elements = try await driver.findElements(.css(.class("classElement1")))
            XCTAssertEqual(elements.count, 1)

            let elements2 = try await driver.findElements(.css(.class("classElement2")))
            XCTAssertEqual(elements2.count, 2)

            let idElement1 = try await driver.findElements(.css(.id("idElement1")))
            XCTAssertEqual(idElement1.count, 1)

            let idElement2 = try await driver.findElements(.css(.id("idElement2")))
            XCTAssertEqual(idElement2.count, 2)

            let nameElement1 = try await driver.findElements(.css(.name("nameElement1")))
            XCTAssertEqual(nameElement1.count, 1)

            let nameElement2 = try await driver.findElements(.css(.name("nameElement2")))
            XCTAssertEqual(nameElement2.count, 2)
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGetElementsByXPath() async {
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
            try await driver.navigateTo(urlString: testPageURLString)
            
            let xpathElements = try await driver
                .findElements(.xpath("/html/body/div"))
            XCTAssertEqual(xpathElements.count, 9)
            
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
            try await driver.navigateTo(urlString: testPageURLString)
            
            let linkElement1 = try await driver
                .findElements(.linkText("1linkElement"))
            
            XCTAssertEqual(linkElement1.count, 1)
            
            let linkElement2 = try await driver
                .findElements(.linkText("2linkElements"))
            
            XCTAssertEqual(linkElement2.count, 2)
            
            
            
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
            try await driver.navigateTo(urlString: testPageURLString)
            
            let linkElement1 = try await driver
                .findElements(.particalLinkText("1"))
            
            XCTAssertEqual(linkElement1.count, 1)
            
            let linkElement2 = try await driver
                .findElements(.particalLinkText("2"))
            
            XCTAssertEqual(linkElement2.count, 2)
            
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
            try await driver.navigateTo(urlString: testPageURLString)
            
            let tagElement1 = try await driver
                .findElements(.tagName("p"))
            
            XCTAssertEqual(tagElement1.count, 1)
            
            let tagElement2 = try await driver
                .findElements(.tagName("b"))
            
            XCTAssertEqual(tagElement2.count, 2)
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

import SwiftWebDriver

let chromeOption = try ChromeOptions(
  args: [
    Args(.headless),
  ]
)

let chromeDriver = try ChromeDriver(
    driverURLString: "http://localhost:9515",
    browserObject: chromeOption
)

let driver = WebDriver(
    driver: chromeDriver
)

Task.detached {
    do {
        let status = try await driver.status()
        print(status)
        let sessionId = try await driver.start()
        print(sessionId)
        try await driver.stop()
    } catch {
        print(error)
    }
}

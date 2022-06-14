import SwiftWebDriver

let chromeOption = try ChromeOptions(
  args: [
    Args(.headless),
  ]
)


//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/03.
//

import Foundation
import NIOCore

public class WebDriver<T: Driver> {
    
    let driver: T
    
    
    /// init webDriver
    /// - Parameter driver:Driver
    public required init(driver: T) {
        self.driver = driver
    }

    /// webdriver start method
    /// - Returns: session id
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func start() async throws -> String {
        let result = try await driver.start()
        return result
    }

    @discardableResult
    /// webdriver start method
    /// - Returns: session id
    public func start() throws -> EventLoopFuture<String> {
        return  driver.start()
    }

    /// webdriver stop method
    /// - Returns: nil
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func stop() async throws -> String? {
        return try await driver.stop()
    }

    
    
    /// webdriver stop method
    /// - Returns: nil
    @discardableResult
    public func stop() throws -> EventLoopFuture<String?> {
        return try driver.stop()
    }

    
    /// webdriver status
    /// - Returns: StatusResponse
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func status() async throws -> StatusResponse {
        return try await driver.status()
    }

    
    /// webdriver status
    /// - Returns: StatusResponse
    public func status() throws -> EventLoopFuture<StatusResponse> {
        return driver.status()
    }
    
    public func getNavigation() throws -> EventLoopFuture<GetNavigationResponse> {
        return try driver.getNavigation()
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func getNavigation() async throws -> GetNavigationResponse {
        return try await getNavigation().get()
    }
    
    /// load Page
    /// - Parameter url: load page url
    /// - Returns: EventLoopFuture<PostNavigationResponse>
    @discardableResult
    public func navigateTo(url: String) throws -> EventLoopFuture<PostNavigationResponse> {
        return try driver.postNavigation(requestURL: url)
    }
    
    
    /// load page
    /// - Parameter url: load page url
    /// - Returns: PostNavigationResponse
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func navigateTo(url: String) async throws -> PostNavigationResponse {
        return try await navigateTo(url: url).get()
    }
    
    @discardableResult
    public func navigateTo(url: URL) async throws -> PostNavigationResponse {
        return try await navigateTo(url: url.absoluteString).get()
    }
    
    
    /// navigation back
    /// - Returns: EventLoopFuture<PostNavigationBackResponse>
    public func navigationBack() throws -> EventLoopFuture<PostNavigationBackResponse> {
        return try driver.postNavigationBack()
    }
    
    /// navigation back
    /// - Returns: EventLoopFuture<PostNavigationBackResponse>
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func navigationBack() async throws -> PostNavigationBackResponse {
        return try await driver.postNavigationBack().get()
    }
    
    /// navigation forward
    /// - Returns: EventLoopFuture<PostNavigationForwardResponse>
    public func navigatonForward() throws -> EventLoopFuture<PostNavigationForwardResponse> {
        return try driver.postNavigationForward()
    }
    
    /// navigation forward
    /// - Returns: EventLoopFuture<PostNavigationForwardResponse>
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func navigatonForward() async throws -> PostNavigationForwardResponse {
        return try await navigatonForward().get()
    }
    
    public func navigatonRefresh() throws -> EventLoopFuture<PostNavigationRefreshResponse> {
        return try driver.postNavigationRefresh()
    }
    
    @discardableResult
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func navigatonRefresh() async throws -> PostNavigationRefreshResponse {
        return try await navigatonRefresh().get()
    }
    
    public func navigationTitle() throws -> EventLoopFuture<GetNavigationTitleResponse> {
        return try driver.getNavigationTitle()
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func navigationTitle() async throws -> GetNavigationTitleResponse {
        return try await navigationTitle().get()
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func findElement(_ locatorType: LocatorType) async throws -> Element {
        return try await driver.findElement(locatorType)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func findElements(_ locatorType: LocatorType) async throws -> Elements {
        return try await driver.findElements(locatorType)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func screenshot() async throws -> String {
        return try await driver.getScreenShot()
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func waitUntil(_ locatorType: LocatorType, retryCount: Int = 3, durationSeconds: Int = 1) async throws -> Bool {
        return try await driver.waitUntil(locatorType, retryCount: retryCount, durationSeconds: durationSeconds)
    }
}

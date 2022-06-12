//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/04.
//

import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient

internal class ChromeDriver: Driver {
    
    
    public typealias BrowserOption = ChromeOptions
    
    public var browserObject: ChromeOptions
    
    public var url: URL
    
    let client = APIClient.shared
    
    public var sessionId: String?
    
    required init(driverURL url: URL, browserObject: ChromeOptions) {
        self.url = url
        self.browserObject = browserObject
    }
    
    convenience init(driverURLString urlString: String = "http://localhost:4444", browserObject: ChromeOptions) throws{
        guard let url = URL(string: urlString) else {
            throw HTTPClientError.invalidURL
        }
        self.init(driverURL: url, browserObject: browserObject)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func start() async throws -> String {
        return try await start().get()
    }
    
    public func start() -> EventLoopFuture<String> {
        let request = NewSessionRequest(baseURL: url, chromeOptions: browserObject)
        return client.request(request).map { response in
            self.sessionId = response.value.sessionId
            return response.value.sessionId
        }
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func stop() async throws -> String? {
        return try await self.stop().get()
    }
    
    public func stop() throws -> EventLoopFuture<String?> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = DeleteSessionRequest(baseURL: url, sessionId: sessionId)
        return client.request(request).map{ response in
            return response.value
        }
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func status() async throws -> StatusResponse {
        return try await status().get()
    }
    
    public func status() -> EventLoopFuture<StatusResponse> {
        let request = StatusRequest(baseURL: url)
        return client.request(request)
    }
    
    public func getNavigation() async throws -> GetNavigationResponse {
        return try await getNavigation().get()
    }
    
    public func getNavigation() throws -> EventLoopFuture<GetNavigationResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = GetNavigationRequest(baseURL: url, sessionId: sessionId)
        return client.request(request)
    }
    
    public func postNavigation(requestURL: String) async throws -> PostNavigationResponse {
        return try await postNavigation(requestURL: requestURL).get()
    }
    
    public func postNavigation(requestURL: String) throws -> EventLoopFuture<PostNavigationResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostNavigationRequest(baseURL: url, sessionId: sessionId, requestURL: requestURL)
        return client.request(request)
    }
    
    public func postNavigationBack() async throws -> PostNavigationBackResponse {
        return try await postNavigationBack().get()
    }
    
    public func postNavigationBack() throws -> EventLoopFuture<PostNavigationBackResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostNavigationBackRequest(baseURL: url, sessionId: sessionId)
        return client.request(request)
    }
    
    public func postNavigationForward() async throws -> PostNavigationForwardResponse {
        return try await postNavigationForward().get()
    }
    
    public func postNavigationForward() throws -> EventLoopFuture<PostNavigationForwardResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostNavigationForwardRequest(baseURL: url, sessionId: sessionId)
        return client.request(request)
    }
    
    public func postNavigationRefresh() async throws -> PostNavigationRefreshResponse {
        return try await postNavigationRefresh().get()
    }
    
    public func postNavigationRefresh() throws -> EventLoopFuture<PostNavigationRefreshResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostNavigationRefreshRequest(baseURL: url, sessionId: sessionId)
        return client.request(request)
    }
    
    public func getNavigationTitle() async throws -> GetNavigationTitleResponse {
        return try await getNavigationTitle().get()
    }
    
    public func getNavigationTitle() throws -> EventLoopFuture<GetNavigationTitleResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = GetNavigationTitleRequest(baseURL: url, sessionId: sessionId)
        return client.request(request)
    }
    
    public func postElement(locatorSelector: LocatorSelector) async throws -> PostElementResponse {
        return try await postElement(locatorSelector: locatorSelector)
    }
    
    public func postElement(locatorSelector: LocatorSelector) throws -> EventLoopFuture<PostElementResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementRequest(baseURL: url, sessionId: sessionId, cssSelector: locatorSelector)
        return client.request(request)
    }
    
    public func postElements(locatorSelector: LocatorSelector) async throws -> PostElementsResponse {
        return try await postElements(locatorSelector: locatorSelector)
    }
    
    public func postElements(locatorSelector: LocatorSelector) throws -> EventLoopFuture<PostElementsResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementsRequest(baseURL: url, sessionId: sessionId, cssSelector: locatorSelector)
        return client.request(request)
    }
    
    public func postElementByElementId(locatorSelector: LocatorSelector, elementId: String) async throws -> PostElementByIdResponse {
        return try await postElementByElementId(locatorSelector: locatorSelector, elementId: elementId)
    }
    
    public func postElementByElementId(locatorSelector: LocatorSelector, elementId: String) throws -> EventLoopFuture<PostElementByIdResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementByIdRequest(baseURL: url, sessionId: sessionId, elementId: elementId, cssSelector: locatorSelector)
        return client.request(request)
    }
    
    func postElementsByElementId(locatorSelector: LocatorSelector, elementId: String) throws -> EventLoopFuture<PostElementsByIdResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementsByIdRequest(baseURL: url, sessionId: sessionId, elementId: elementId, cssSelector: locatorSelector)
        return client.request(request)
    }
    
    func postElementsByElementId(locatorSelector: LocatorSelector, elementId: String) async throws -> PostElementsByIdResponse {
        return try await postElementsByElementId(locatorSelector: locatorSelector, elementId: elementId)
    }
    
    func getElementText(elementId: String) async throws -> GetElementTextResponse {
        return try await getElementText(elementId: elementId)
    }
    
    func getElementText(elementId: String) throws -> EventLoopFuture<GetElementTextResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = GetElementTextRequest(baseURL: url, sessionId: sessionId, elementId: elementId)
        return client.request(request)
    }
    
    func getElementName(elementId: String) async throws -> GetElementNameResponse {
        return try await getElementName(elementId: elementId)
    }
    
    func getElementName(elementId: String) throws -> EventLoopFuture<GetElementNameResponse> {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = GetElementNameRequest(baseURL: url, sessionId: sessionId, elementId: elementId)
        return client.request(request)
    }
    
    func findElement(_ locatorType: LocatorType) async throws -> Element {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementRequest(baseURL: url, sessionId: sessionId, cssSelector: locatorType.create())
        let response = try await client.request(request)
        return Element(baseURL: url, sessionId: sessionId, elementId: response.elementId)
    }
    
    func findElements(_ locatorType: LocatorType) async throws -> Elements {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementsRequest(baseURL: url, sessionId: sessionId, cssSelector: locatorType.create())
        let response = try await client.request(request)
        return response.value.map { elementId in
            Element(baseURL: url, sessionId: sessionId, elementId: elementId)
        }
    }
    
    func getScreenShot() async throws -> String {
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = GetSceenShotRequest(baseURL: url, sessionId: sessionId)
        let response = try await client.request(request)
        return response.value
    }
    
    func waitUntil(_ locatorType: LocatorType, retryCount: Int = 3, durationSeconds: Int = 1) async throws -> Bool {
        
        guard let sessionId = sessionId else {
            throw WebDriverError.sessionIdisNil
        }
        let request = PostElementRequest(baseURL: url, sessionId: sessionId, cssSelector: locatorType.create())
        
        do {
            let _ = try await client.request(request)
            return true
        } catch let error  {
            guard
                retryCount > 0,
                let error = error as? SeleniumError
                else { return false }
            
            guard error.value.error == "no such element" else {
                return false
            }
            
            let retryCount = retryCount - 1
            
            sleep(UInt32(durationSeconds))
            
            return try await waitUntil(locatorType, retryCount: retryCount, durationSeconds: durationSeconds)
        }
    }
    
}

//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/03.
//

import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient

protocol StatableOpject: Codable {}

public protocol Driver: FindElementProtocol {
    
    associatedtype BrowserOption
    
    var browserObject: BrowserOption { get }
    
    var url: URL { get }
    
    var sessionId: String? { get }
    
    func start() async throws -> String
    func start() -> EventLoopFuture<String>
    
    func stop() async throws -> String?
    func stop() throws -> EventLoopFuture<String?>
    
    func status() async throws -> StatusResponse
    func status() -> EventLoopFuture<StatusResponse>
    
    func getNavigation() async throws -> GetNavigationResponse
    func getNavigation() throws -> EventLoopFuture<GetNavigationResponse>
    
    func postNavigation(requestURL: String) async throws -> PostNavigationResponse
    func postNavigation(requestURL: String) throws -> EventLoopFuture<PostNavigationResponse>
    
    func postNavigationBack() async throws -> PostNavigationBackResponse
    func postNavigationBack() throws -> EventLoopFuture<PostNavigationBackResponse>
    
    func postNavigationForward() async throws -> PostNavigationForwardResponse
    func postNavigationForward() throws -> EventLoopFuture<PostNavigationForwardResponse>
    
    func postNavigationRefresh() async throws -> PostNavigationRefreshResponse
    func postNavigationRefresh() throws -> EventLoopFuture<PostNavigationRefreshResponse>
    
    func getNavigationTitle() async throws -> GetNavigationTitleResponse
    func getNavigationTitle() throws -> EventLoopFuture<GetNavigationTitleResponse>
    
    func getScreenShot() async throws -> String
    
    func waitUntil(_ locatorType: LocatorType, retryCount: Int, durationSeconds: Int) async throws -> Bool
}

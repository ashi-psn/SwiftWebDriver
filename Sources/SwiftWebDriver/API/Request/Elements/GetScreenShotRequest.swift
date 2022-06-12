//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/10.
//

import Foundation
import AsyncHTTPClient
import NIOHTTP1
import NIO

internal struct GetSceenShotRequest: RequestType {
    
    typealias Response = GetScreenShotResponse
    
    var baseURL: URL
    
    var sessionId: String
    
    var path: String {
        "session/\(sessionId)/screenshot"
    }
    
    var method: HTTPMethod = .GET
    
    var headers: HTTPHeaders = [:]
    
    var body: HTTPClient.Body?
    
}


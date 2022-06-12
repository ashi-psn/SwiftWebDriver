//
//  StatusRequest.swift
//  
//
//  Created by ashizawa on 2022/06/02.
//

import Foundation
import NIOHTTP1
import AsyncHTTPClient

internal struct StatusRequest: RequestType {
    
    typealias Response = StatusResponse
    
    var baseURL: URL
    
    var path: String = "status"
    
    var method: HTTPMethod = .GET
    
    var headers: HTTPHeaders = [:]
    
    var body: HTTPClient.Body?
    
}

//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/02.
//

import Foundation

public struct StatusResponse: Codable {
    let value: Value
    
    struct Value: Codable {
        let ready: Bool
        let message: String
    }
}

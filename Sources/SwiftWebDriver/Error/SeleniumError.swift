//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/05.
//

import Foundation

struct SeleniumError: Codable, LocalizedError {
    let value: Value
    var errorDescription: String? {
        return "error : \(value.error), message: \(value.message)"
    }
}


extension SeleniumError {
    struct Value: Codable {
        let message: String
        let error: String
    }
}

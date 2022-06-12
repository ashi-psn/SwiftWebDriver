//
//  File.swift
//  
//
//  Created by ashizawa on 2022/06/06.
//

import Foundation

enum WebDriverError: LocalizedError {
    case sessionIdisNil
    var errorDescription: String? {
        switch self {
        case .sessionIdisNil:
            return "session id must not be nil"
        }
    }
}

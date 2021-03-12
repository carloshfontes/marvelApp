//
//  ServiceHandleError.swift
//  Service
//
//  Created by Carlos Fontes on 12/03/21.
//

import Foundation

enum ServiceHandleError: Error {
    
    case decode
    case invalidUrl
    case badRequest
    case requestFailed

    var description: String {
        switch self {
        
        case .decode:
            return "Error to Decode."
        case .invalidUrl:
            return "Error in url."
        case .badRequest:
            return "Bad request"
        case .requestFailed:
            return "Request failed. Please, try again later."
        }
    }

}

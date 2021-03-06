//
//  ServiceProtocol.swift
//  Service
//
//  Created by Carlos Fontes on 12/03/21.
//

import Foundation

public protocol ServiceProtocol {
    var path: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

public extension ServiceProtocol {
    
    var urlComponents: URLComponents? {
        guard var components = URLComponents(string: path) else { return nil}
        
        var queryItems: [URLQueryItem] = []
        
        
        if let params = parameters {
            queryItems.append(contentsOf: params.map {
                return URLQueryItem(name: "\($0)", value: "\($1)")
            })
        }
                
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents?.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(key, forHTTPHeaderField: value)
            }
        }
        
        return request
    }
}

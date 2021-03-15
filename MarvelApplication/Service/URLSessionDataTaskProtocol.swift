//
//  URLSessionDataTaskProtocol.swift
//  Service
//
//  Created by Carlos Fontes on 12/03/21.
//

import Foundation

public protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}

extension URLSessionDataTaskProtocol {
    func resume() {}
    func cancel() {}

}
extension URLSessionDataTask: URLSessionDataTaskProtocol{}

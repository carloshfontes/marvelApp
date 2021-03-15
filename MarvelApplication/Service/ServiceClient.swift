//
//  ServiceClient.swift
//  Service
//
//  Created by Carlos Fontes on 12/03/21.
//

import Foundation

public protocol ServiceClient {
    
    var session: URLSessionProtocol { get }
    
    func fetch<T: Decodable>(withRequest request: URLRequest, withDecondingType decoding: T.Type, completion: @escaping (Result<T, ServiceHandleError>) -> Void)
    
}

extension ServiceClient {
    
    private func decode<T: Decodable>(data: Data, using: T.Type) -> T? {
        let decoder = JSONDecoder()
        
        guard let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        
        return object
    }
    
    public func fetch<T: Decodable>(withRequest request: URLRequest, withDecondingType decoding: T.Type, completion: @escaping (Result<T, ServiceHandleError>) -> Void) {
        
        session.dataTaskWithRequest(request) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            guard let object = self.decode(data: data, using: decoding.self) else {
                return completion(.failure(.decode))
            }
            
            completion(.success(object))
        }.resume()
        
    }
}

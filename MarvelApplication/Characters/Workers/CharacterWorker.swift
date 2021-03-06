//
//  CharacterWorker.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation
import Service

typealias CharacterFechCompletion = (Result<[Character], ServiceHandleError>) -> Void

protocol CharacterServiceWorkerProtocol: class {
    func getListOfCharactersOrder(by order: CharacterOrderBy, andWithLimit limit: Int, completion: @escaping CharacterFechCompletion)
    
    func getListOfCharactersStartsWith(_ name: String, orderBy order: CharacterOrderBy, andWithLimit limit: Int, completion: @escaping (Result<[Character], ServiceHandleError>) -> Void)
}

public final class CharacterServiceWorker: CharacterServiceWorkerProtocol, ServiceClient {

    public var session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared){
        self.session = session
    }
    
    
    public func getListOfCharactersOrder(by order: CharacterOrderBy, andWithLimit limit: Int, completion: @escaping (Result<[Character], ServiceHandleError>) -> Void) {
        
        guard let request = CharacterProvider.characters(orderBy: order, limit: limit, startsWithName: nil).request else {
            return completion(.failure(.badRequest))
        }
        
        fetch(withRequest: request, withDecondingType: Marvel.self) { (result) in
            switch result {
            
            case .success(let marvel):
                completion(.success(marvel.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    public func getListOfCharactersStartsWith(_ name: String, orderBy order: CharacterOrderBy, andWithLimit limit: Int, completion: @escaping (Result<[Character], ServiceHandleError>) -> Void) {
        
        guard let request = CharacterProvider.characters(orderBy: order, limit: limit, startsWithName: name).request else {
            return completion(.failure(.badRequest))
        }
        
        fetch(withRequest: request, withDecondingType: Marvel.self) { (result) in
            switch result {
            
            case .success(let marvel):
                completion(.success(marvel.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}

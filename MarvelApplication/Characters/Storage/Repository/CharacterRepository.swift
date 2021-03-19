//
//  CharacterRepository.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation
import CoreData

protocol CharacterRepository {
    
    func get(id: UUID, completion: @escaping (Result<CharacterProtocol, CoreDataHandleError>) -> Void)
    
    func list(completion: @escaping (Result<[CharacterProtocol], CoreDataHandleError>) -> Void)
    
    func add(_ item: CharacterProtocol, completion: @escaping (Result<Void, CoreDataHandleError>) -> Void)
    
    func delete(_ item: CharacterProtocol, completion: (Result<Void, CoreDataHandleError>) -> Void)
    
    
}

extension CharacterRepository {
    
    func edit(_ item: CharacterProtocol, completion:  @escaping (Result<Void, CoreDataHandleError>) -> Void) {}
}




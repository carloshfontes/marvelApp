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
    
    func edit(_ item: CharacterProtocol, completion:  @escaping (Result<Void, CoreDataHandleError>) -> Void)
}

struct CharacterCoreDataRepository: CharacterRepository {
    
    let context: NSManagedObjectContext
    
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func get(id: UUID, completion: @escaping (Result<CharacterProtocol, CoreDataHandleError>) -> Void) {
        
        let fetchRequest: NSFetchRequest = CharacterCD.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id.uuidString)
        fetchRequest.predicate = predicate
        
        do {
            
            let object = try context.fetch(fetchRequest)
            
            guard let character = object.first else {
                completion(.failure(.notFound))
                return
            }
            
            let characterObject: CharacterProtocol = CharacterObject(name: character.name, description: character.characterDescription ?? "", id: character.id, characterID: Int(character.characterID), thumbnail: character.thumbnail)
            
            completion(.success(characterObject))
            
        }catch{
            completion(.failure(.cantFetch))
        }
    }
    
    func list(completion: @escaping (Result<[CharacterProtocol], CoreDataHandleError>) -> Void) {
        
        let fetchRequest: NSFetchRequest = CharacterCD.fetchRequest()
        
        do {
            
            let objects = try context.fetch(fetchRequest)
        
            
            let characterList: [CharacterProtocol] = objects.map { (character) -> CharacterProtocol in
                return CharacterObject(name: character.name, description: character.characterDescription, id: character.id, characterID: Int(character.characterID), thumbnail: character.thumbnail)
            }
            
            
            completion(.success(characterList))
            
        }catch{
            completion(.failure(.cantFetch))
        }
        
    }
    
    func add(_ item: CharacterProtocol, completion: @escaping (Result<Void, CoreDataHandleError>) -> Void) {
        
        let characterCD: CharacterCD = CharacterCD(context: self.context)
        characterCD.id = item.id
        characterCD.name = item.name
        characterCD.characterID = Int64(item.characterID)
        characterCD.thumbnail = item.thumbnail
        characterCD.characterDescription = item.description
        
        do{
            try self.context.save()
            completion(.success(()))
        }catch {
            completion(.failure(.cantAdd))
        }
        
    }
    
    func delete(_ item: CharacterProtocol, completion: (Result<Void, CoreDataHandleError>) -> Void) {
        
    }
    
    func edit(_ item: CharacterProtocol, completion: @escaping (Result<Void, CoreDataHandleError>) -> Void) {
        
    }
    
    
}

//
//  CharacterCoreDataRepository.swift
//  Characters
//
//  Created by Carlos Fontes on 19/03/21.
//

import Foundation
import CoreData

public struct CharacterCoreDataRepository: CharacterRepository {
    
    let context: NSManagedObjectContext
    
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func get(id: UUID, completion: @escaping (Result<CharacterProtocol, CoreDataHandleError>) -> Void) {
        
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
    
    public func list(completion: @escaping (Result<[CharacterProtocol], CoreDataHandleError>) -> Void) {
        
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
    
    public func add(_ item: CharacterProtocol, completion: @escaping (Result<Void, CoreDataHandleError>) -> Void) {
        
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
    
    public func delete(_ item: CharacterProtocol, completion: (Result<Void, CoreDataHandleError>) -> Void) {
        
        let fetchRequest: NSFetchRequest = CharacterCD.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", item.id.uuidString)
        fetchRequest.predicate = predicate
        
        do {
            
            let object = try context.fetch(fetchRequest)
            
            guard let character = object.first else {
                completion(.failure(.notFound))
                return
            }
            
            context.delete(character)
            try context.save()
            
            completion(.success(()))
            
        }catch{
            completion(.failure(.cantFetch))
        }
    }
    
}

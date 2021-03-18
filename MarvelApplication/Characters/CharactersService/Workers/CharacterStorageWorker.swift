//
//  CharacterStorageWorker.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation



protocol CharacterStorageWorkerProtocol {
    var repository: CharacterRepository { get set }
    
    //    func getCharacterBy(id: UUID, withCompletion completion: @escaping (Result<CharacterProtocol, Error>) -> Void)
    
    func addCharacterWith(character: CharacterProtocol, withCompletion completion: @escaping (Result<Void, Error>) -> Void)
    func getListOfCharacter(completion: @escaping (Result<[CharacterProtocol], Error>) -> Void)
}


final class CharacterStorageWorker: CharacterStorageWorkerProtocol {
    
    var repository: CharacterRepository
    
    init(repository: CharacterRepository){
        self.repository = repository
    }
    
    func addCharacterWith(character: CharacterProtocol, withCompletion completion: @escaping (Result<Void, Error>) -> Void) {
        
        repository.add(character) { (result) in
            switch result {
            
            case .success:
                completion(.success(()))
            case .failure(let error):
                print("Error "+error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    
    func getListOfCharacter(completion: @escaping (Result<[CharacterProtocol], Error>) -> Void) {
        repository.list { (result) in
            switch result {
            
            case .success(let characterList):
                completion(.success(characterList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

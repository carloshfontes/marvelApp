//
//  CharactersListModels.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation


struct CharactersListModels {
    
    struct Request {
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            
        }
    }
    
    struct Response {
        
        struct Error {
            let message: String
        }
        
        struct Message {
            let text: String
        }
        
        let characterList: [CharacterProtocol]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            
        }
    }
    
    struct Fetch {
        struct Response {
            let characters: [Character]?
            let errorMessage: String?
        }
    }
    
    struct ViewObject {
        
        var characters: [CharacterVO]
        
        struct CharacterVO {
            let id: Int?
            let name: String?
            let description: String?
            let thumbnail: String?
        }
        
    }
    
    struct Error {
        let message: String
    }
}

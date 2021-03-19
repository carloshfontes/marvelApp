//
//  FavoritesModels.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation

struct FavoritesModels {
    
    struct Request {
        
        let characterList: [CharacterProtocol]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            
        }
        
        struct Error {
            let message: String
        }
        
        struct Message {
            let text: String
        }
    }
    
    struct Response {
        
        let characterList: [CharacterVO]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            
        }
        
        struct Error {
            let message: String
        }
        
        struct Message {
            let text: String
        }
    }
    
    struct ViewObject {
        
        let characterList: [CharacterVO]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
               
        }
    }
}

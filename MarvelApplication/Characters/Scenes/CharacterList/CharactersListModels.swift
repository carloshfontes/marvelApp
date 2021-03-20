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
            
            var thumbnailPath: String?
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            
        }
        
        struct Image {
            let path: String?
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
            
            var thumbnailPath: String?
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
        }
        
        struct Image {
            let data: Data
        }
    }
    
    struct Fetch {
        struct Response {
            let characters: [CharacterProtocol]?
            let errorMessage: String?
        }
    }
    
    struct ViewObject {
        
        var characters: [CharacterVO]
        
        struct CharacterVO: CharacterProtocol {
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            var thumbnailPath: String?
        }
        
        struct CharacterProtocolVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            var thumbnailPath: String?

        }
        
        struct Image {
            let data: Data
        }
        
    }
    
    struct Error {
        let message: String
    }
}

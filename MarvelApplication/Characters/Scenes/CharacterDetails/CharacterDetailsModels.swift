//
//  CharacterDetailsModels.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


struct CharacterDetailsModels {
    struct ViewObject {
        struct CharacterVO {
            let id: Int?
            let name: String?
            let description: String?
            let thumbnail: String?
        }
    }
    
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
    }
}

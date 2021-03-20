//
//  CoreDataHandleError.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation



public enum CoreDataHandleError {

    case notFound
    case cantFetch
    case cantAdd
        
}

extension CoreDataHandleError: LocalizedError {
   
    public var errorDescription: String? {
        
        switch self {
        
        case .notFound:
            return "Objeto não encontrado."
            
        case .cantFetch:
            return "Não foi possível buscar os dados."
            
        case .cantAdd:
            return "Não foi possível adicionar o objeto."
        }
    }
}

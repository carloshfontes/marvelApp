//
//  CharactersListInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListInteractorInput: class {
    var presenter: CharactersListPresenterInput? { get set }
}

final class CharactersListInteractor: CharactersListInteractorInput {
    
    var presenter: CharactersListPresenterInput?
    

}

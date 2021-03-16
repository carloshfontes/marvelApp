//
//  CharacterDetailsInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

protocol CharacterDetailsInteractorInput: class {
    var presenter: CharacterDetailsPresenterInput? { get set }
}

final class CharacterDetailsInteractor: CharacterDetailsInteractorInput {
    weak var presenter: CharacterDetailsPresenterInput?
    
    
}

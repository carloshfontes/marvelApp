//
//  CharacterDetailsPresenter.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


protocol CharacterDetailsPresenterInput: class {
    var viewController: CharacterDetailsPresenterOutput? { get set }
    
}

protocol CharacterDetailsPresenterOutput: class {
}

final class CharacterDetailsPresenter: CharacterDetailsPresenterInput {
    
    weak var viewController: CharacterDetailsPresenterOutput?

    
    deinit {
        print("Deinicializado presenter")
    }
}

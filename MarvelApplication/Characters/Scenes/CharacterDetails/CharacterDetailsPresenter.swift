//
//  CharacterDetailsPresenter.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


protocol CharacterDetailsPresenterInput: class {
    var viewController: CharacterDetailsPresenterOutput? { get set }
    
    func presentErrorWith(_ response: CharacterDetailsModels.Response.Error)
    func presentMessageWith(response: CharacterDetailsModels.Response.Message)
    
}

protocol CharacterDetailsPresenterOutput: class {
    func displayErrorWith(_ response: CharacterDetailsModels.Response.Error)
    func displayMessageWith(_ response: CharacterDetailsModels.Response.Message)
}

final class CharacterDetailsPresenter: CharacterDetailsPresenterInput {

    weak var viewController: CharacterDetailsPresenterOutput?

    func presentErrorWith(_ response: CharacterDetailsModels.Response.Error) {
        viewController?.displayErrorWith(response)
    }
    
    func presentMessageWith(response: CharacterDetailsModels.Response.Message) {
        viewController?.displayMessageWith(response)
    }
    
    deinit {
        print("Deinicializado presenter")
    }
}

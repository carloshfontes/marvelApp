//
//  CharactersListInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListInteractorInput: class {
    var presenter: CharactersListPresenterInput? { get set }
    var characterServiceWorker: CharacterServiceWorkerProtocol { get set }
    
    func fetchListOfCharacterOrder(by: CharacterOrderBy, andWithLimit limit: Int)
}

final class CharactersListInteractor: CharactersListInteractorInput {
    
    var characterServiceWorker: CharacterServiceWorkerProtocol
    var presenter: CharactersListPresenterInput?
    
    init(serviceWorker: CharacterServiceWorkerProtocol = CharacterServiceWorker()){
        self.characterServiceWorker = serviceWorker
    }

    func fetchListOfCharacterOrder(by order: CharacterOrderBy, andWithLimit limit: Int) {
        self.characterServiceWorker.getListOfCharactersOrder(by: order, andWithLimit: limit) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let characters):
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: characters, errorMessage: nil))
            case .failure:
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: nil, errorMessage: ""))
            }
        }
    }
}

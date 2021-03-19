//
//  FavoritesInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

protocol FavoritesInteractorInput: class {
    var presenter: FavoritesPresenterInput? { get set }
    
    func fetchListOfChacter()
}

final class FavoritesInteractor: FavoritesInteractorInput {
    var presenter: FavoritesPresenterInput?
    let characterStorageWorker: CharacterStorageWorkerProtocol
    
    init(characterStorageWorker: CharacterStorageWorkerProtocol){
        self.characterStorageWorker = characterStorageWorker
    }
    
    func fetchListOfChacter() {
        characterStorageWorker.getListOfCharacter { [weak self ] (result) in
            guard let self = self else { return }
            switch result {
            
            case .success(let characterList):
                self.presenter?.presentListOfCharacterWith(request: FavoritesModels.Request(characterList: characterList))
            case .failure(let error):
                self.presenter?.presentErrorWith(request: FavoritesModels.Request.Error(message: error.localizedDescription))
                break
            }
        }
    }
    
    
}

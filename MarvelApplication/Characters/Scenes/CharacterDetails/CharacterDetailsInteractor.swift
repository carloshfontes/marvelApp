//
//  CharacterDetailsInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

protocol CharacterDetailsInteractorInput: class {
    var presenter: CharacterDetailsPresenterInput? { get set }
    var characterStorageWorker: CharacterStorageWorkerProtocol { get set }

    
    func addCharacterWith(request: CharacterDetailsModels.Request.CharacterVO)

}

final class CharacterDetailsInteractor: CharacterDetailsInteractorInput {
        
    var presenter: CharacterDetailsPresenterInput?
    var characterStorageWorker: CharacterStorageWorkerProtocol

    init(characterStorageWorker: CharacterStorageWorkerProtocol){
        self.characterStorageWorker = characterStorageWorker
    }
    
    func addCharacterWith(request: CharacterDetailsModels.Request.CharacterVO) {
        
        self.characterStorageWorker.addCharacterWith(character: request) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success:
                self.presenter?.presentMessageWith(response: CharacterDetailsModels.Response.Message(text: "Personagem favoritado com sucesso"))
            case .failure:
                self.presenter?.presentErrorWith(CharacterDetailsModels.Response.Error(message: "Erro para favoritar personagem!"))
            }
        }
    }
    
    deinit {
        print("Deinicializado interactor")
    }
}

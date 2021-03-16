//
//  CharacterDetailsViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

public final class CharacterDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var characterVO: CharacterDetailsModels.ViewObject.CharacterVO?
    var interactor: CharacterDetailsInteractorInput?
    var router: CharacterDetailsRouterProtocol?
    
    // MARK: - Lifecycle

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Presenter output

extension CharacterDetailsViewController: CharacterDetailsPresenterOutput {
    
}

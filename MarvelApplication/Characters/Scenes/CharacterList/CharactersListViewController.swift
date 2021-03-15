//
//  CharactersListViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation


public final class CharactersListViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: CharactersListInteractorInput?
    var router: CharactersListRouterProtocol?
    
    // MARK: - View Lifecycle
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewWillAppear(_ animated: Bool) {

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions


// MARK: - Presenter output
extension CharactersListViewController: CharactersListPresenterOutput {
    
    func displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject) {
        
    }
    
    func displayErrorWith(message: CharactersListModels.Error) {
        
    }
    
    
}

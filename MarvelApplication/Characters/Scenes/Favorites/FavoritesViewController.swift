//
//  FavoritesViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


public final class FavoritesViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: FavoritesInteractorInput?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Presenter

extension FavoritesViewController: FavoritesPresenterOutput {
    
}

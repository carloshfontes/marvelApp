//
//  FavoritesInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

protocol FavoritesInteractorInput: class {
    var presenter: FavoritesPresenterInput? { get set }
}

final class FavoritesInteractor: FavoritesInteractorInput {
    var presenter: FavoritesPresenterInput?
    
    
}

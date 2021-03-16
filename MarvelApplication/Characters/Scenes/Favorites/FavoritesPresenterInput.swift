//
//  FavoritesPresenterInput.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


protocol FavoritesPresenterInput: class {
    var viewController: FavoritesPresenterOutput? { get set }

}

protocol FavoritesPresenterOutput: class {
}

final class FavoritesPresenter: FavoritesPresenterInput {
    weak var viewController: FavoritesPresenterOutput?
    
    
}

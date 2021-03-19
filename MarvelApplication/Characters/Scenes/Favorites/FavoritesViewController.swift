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
    
    private var characterTableViewDataSource: CharacterTableViewDataSource? {
        didSet {
            setupCharacterTableViewDataSourceAndDelegate()
        }
    }
        
    // MARK: - View
    
    var favoriteView: FavoritesView = {
        let view = FavoritesView(frame: .zero)
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func loadView() {
        self.view = favoriteView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.interactor?.fetchListOfChacter()
    }
    
    // MARK: - Methods
    
    private func setupCharacterTableViewDataSourceAndDelegate(){
        guard let dataSource = characterTableViewDataSource else { return }
        
        DispatchQueue.main.async {
            self.favoriteView.charactersTableView.dataSource = dataSource
            self.favoriteView.charactersTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Presenter

extension FavoritesViewController: FavoritesPresenterOutput {
    
    func displayListOfCharacterWith(response: CharacterDetailsModels.Response) {
      print(response)
    }
    
    
}

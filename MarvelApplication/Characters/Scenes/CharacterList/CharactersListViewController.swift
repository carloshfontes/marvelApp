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
    
    // MARK: - DataSource and Delegates
    
    private var characterCollectionDataSource: CharacterCollectionViewDataSource? {
        didSet {
            setupCharacterCollectionViewDataSourceAndDelegate()
        }
    }
    
    private var characterCollectionDelegate: CharacterCollectionViewDelegate?
    
    // MARK: - View
    
    let characterListView: CharacterListView = {
        let view = CharacterListView()
        return view
    }()
    
    
    // MARK: - View Lifecycle
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func loadView() {
        self.view = characterListView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        interactor?.fetchListOfCharacterOrder(by: .nameIncrease, andWithLimit: 80)
    }
    
    // MARK: - Functions
    
    private func setupCharacterCollectionViewDataSourceAndDelegate(){
        guard let dataSource = characterCollectionDataSource else { return }
        guard let delegate = characterCollectionDelegate else { return }

        DispatchQueue.main.async {
            self.characterListView.characterCollectionView.delegate = delegate

            self.characterListView.characterCollectionView.dataSource = dataSource
            self.characterListView.characterCollectionView.reloadData()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions


// MARK: - Presenter output
extension CharactersListViewController: CharactersListPresenterOutput {
    
    func displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject) {
        self.characterCollectionDelegate = CharacterCollectionViewDelegate()
        self.characterCollectionDataSource = CharacterCollectionViewDataSource()

    }
    
    func displayErrorWith(message: CharactersListModels.Error) {
        
    }
    
    
}

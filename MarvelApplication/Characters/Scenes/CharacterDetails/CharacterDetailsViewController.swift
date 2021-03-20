//
//  CharacterDetailsViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

public final class CharacterDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: CharacterDetailsInteractorInput?
    var router: CharacterDetailsRouterProtocol?
    var characterViewObject: CharacterProtocol?
    
    // MARK: - Views
    var characterDetailsView: CharacterDetailsView = {
        let view = CharacterDetailsView(frame: .zero)
        return view
    }()
    
    // MARK: - Lifecycle

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    public override func loadView() {
        self.view = characterDetailsView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.removeNavigationImage()
        characterDetailsView.configViewWith(characterViewObject?.thumbnailPath, orWithImageData: characterViewObject?.thumbnail, withDescription: characterViewObject?.description, andWithName: characterViewObject?.name)
        
    }
    
    // MARK: - Methods
    
    private func removeNavigationImage(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deinicializado vc")
    }
}


// MARK: - Presenter output

extension CharacterDetailsViewController: CharacterDetailsPresenterOutput {
    
    func displayListOfCharacterWith(response: CharacterDetailsModels.Response) {
        print(response)
    }
    
    
}

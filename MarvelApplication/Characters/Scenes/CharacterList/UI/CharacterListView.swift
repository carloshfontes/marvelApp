//
//  CharacterListView.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation
import MarvelUI

final class CharacterListView: UIView {
    
    let searchBar: UISearchBar = {
        let search = UISearchBar(frame: .zero)
        search.placeholder = "Insira o nome de um personagem"
        return search
    }()
    


    
    var characterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.uniqueIdentifier)
        view.backgroundColor = .clear
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK: - Functions
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable

extension CharacterListView: ViewCodable {

    func setupViewHierarchy() {
       addSubview(searchBar)
       addSubview(characterCollectionView)
    }

    func setupConstraints() {
        setupSearchBarConstraints()
        setupCharacterCollectionViewConstraints()
    }

    private func setupCharacterCollectionViewConstraints(){
        characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea: UILayoutGuide = layoutMarginsGuide
        characterCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        characterCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        characterCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        characterCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupSearchBarConstraints(){
        searchBar.sizeToFit()
    }
}

//
//  FavoritesView.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation
import MarvelUI

final class FavoritesView: UIView {
    
    let charactersTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.uniqueIdentifier)
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable

extension FavoritesView: ViewCodable {
    
    func setupViewHierarchy() {
        addSubview(charactersTableView)
    }
    
    func setupConstraints() {
        setupCharactersTableViewConstraints()
    }
    
    private func setupCharactersTableViewConstraints(){
        charactersTableView.setLeftConstraintWith(leftAnchor)
        charactersTableView.setRightConstraintWith(rightAnchor)
        charactersTableView.setTopConstraintWith(topAnchor)
        charactersTableView.setBottomConstraintWith(bottomAnchor)
    }
    
}

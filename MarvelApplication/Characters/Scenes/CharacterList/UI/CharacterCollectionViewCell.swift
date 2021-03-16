//
//  CharacterCollectionViewCell.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation
import MarvelUI

final class CharacterCollectionViewCell: UICollectionViewCell, Identifiable {
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let backgroundMaskView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = ""
        return label
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    private func setupUI(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        setupViews()
    }
    
    func configWith(name: String, andWithImagePath path: String?){
        self.nameLabel.text = name
        
        if let unwrappedImagePath = path {
            backgroundImageView.setupWith(url: unwrappedImagePath)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - View Codable

extension CharacterCollectionViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(backgroundMaskView)
        addSubview(nameLabel)
        backgroundImageView.addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        setupNameLabelConstraints()
        setupBackgroundImageViewConstraints()
        setupBackgroundMaskViewConstraints()
        setupFavoriteButtonConstraints()
    }
    
    private func setupNameLabelConstraints(){
        nameLabel.setCenterXWith(self.centerXAnchor)
        nameLabel.setBottomConstraintWith(self.bottomAnchor, withConstantEqualTo: 20)
    }
    
    private func setupBackgroundImageViewConstraints(){
        backgroundImageView.setLeftConstraintWith(leftAnchor)
        backgroundImageView.setRightConstraintWith(rightAnchor)
        backgroundImageView.setTopConstraintWith(topAnchor)
        backgroundImageView.setBottomConstraintWith(bottomAnchor)
    }
    
    private func setupBackgroundMaskViewConstraints(){
        backgroundMaskView.setLeftConstraintWith(backgroundImageView.leftAnchor)
        backgroundMaskView.setRightConstraintWith(backgroundImageView.rightAnchor)
        backgroundMaskView.setTopConstraintWith(backgroundImageView.topAnchor)
        backgroundMaskView.setBottomConstraintWith(backgroundImageView.bottomAnchor)
    }
    
    private func setupFavoriteButtonConstraints(){
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setTopConstraintWith(backgroundMaskView.topAnchor, withConstantEqualTo: 20)
        favoriteButton.setRightConstraintWith(backgroundMaskView.rightAnchor, withConstantEqualTo: 10)
    }
    
}

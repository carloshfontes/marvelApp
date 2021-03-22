//
//  ViewCodable.swift
//  MarvelUI
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

public protocol ViewCodable {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}

public extension ViewCodable {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() {}
}

//
//  Identifiable.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

protocol Identifiable: AnyObject {
    static var uniqueIdentifier: String { get }
}

extension Identifiable {
    static var uniqueIdentifier: String {
        String(describing: self)
    }
}

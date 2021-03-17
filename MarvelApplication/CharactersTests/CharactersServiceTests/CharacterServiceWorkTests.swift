//
//  CharacterServiceWorkTests.swift
//  CharactersTests
//
//  Created by Carlos Fontes on 17/03/21.
//

import Foundation
import XCTest
import Characters

class CharacterServiceWorkTests: XCTestCase {
    
    var sut: CharacterServiceWorker!
    var session: MockURLSession!
    
    override func setUp() {
        self.session = MockURLSession()
        self.sut = CharacterServiceWorker(session: self.session)
        super.setUp()
    }
    
    override func tearDown() {
        self.sut = nil
        self.session = nil
        super.tearDown()
    }
    
    func testNetworkRequest_WhenFetchCharacters_ShouldReturnCharacters(){
        let expectedData = CharacterMockData().data
        session.data = expectedData
        
        var characterList: [Character]?
        
        self.sut.getListOfCharactersOrder(by: .nameIncrease, andWithLimit: 3) { (result) in
            
            switch result {
            case .success(let characters):
                print(characters)
                characterList = characters
            case .failure(let error):
                print("Error: ",error)
            
            }
        }
        
        XCTAssertNotNil(characterList)
    }
}

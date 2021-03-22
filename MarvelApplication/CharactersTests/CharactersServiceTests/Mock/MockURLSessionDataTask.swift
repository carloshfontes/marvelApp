//
//  MockURLSessionDataTask.swift
//  CharactersTests
//
//  Created by Carlos Fontes on 17/03/21.
//

import Foundation
import Service


class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    private(set) var resumeWasCalled = false
    
    func resume(){
        resumeWasCalled = true
    }
    
}

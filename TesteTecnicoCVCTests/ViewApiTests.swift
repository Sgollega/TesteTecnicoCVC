//
//  ViewApiTests.swift
//  TesteTecnicoCVCTests
//
//  Created by Silvio Gollega Jr. on 01/03/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import XCTest
import TesteTecnicoCVC

class ViewApiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testalteraSenha() {
        let view = ViewApi()
        
        //verifica se a gravacao da senha retorna verdadeiro
        XCTAssertTrue(view.alteraSenha())
    }
}

//
//  ViewPresenterTests.swift
//  TesteTecnicoCVCTests
//
//  Created by Silvio Gollega Jr. on 01/03/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import XCTest
import TesteTecnicoCVC

class ViewPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //testando os casos de validacao de senha
    func testisPasswordValid() {
        let viewPresenter = ViewPresenterImplementation()
        let senha =  "abcd12"
        let senha2 = "qwerty"
        let senha3 = "qwertyuiopasdfghjk"
        let senha4 = "qwertyuiopasdfghj1"
        let senha5 = "asdfghjklpoiuytre12345"
        let senha6 = "12345"

        //verifica se a senha "coreta" passa na validacao de das regras para a senha
        XCTAssertTrue(viewPresenter.isPasswordValid(senha))
        
        //verifica se a senha contendo apenas letras passa. Neste caso tem que falhar
        XCTAssertFalse(viewPresenter.isPasswordValid(senha2))
        //verifica se a senha com limite de caracteres e sem numeros passa. Aqui tem que falhar
        
        XCTAssertFalse(viewPresenter.isPasswordValid(senha3))
        
        //verifica se a senha com o máximo de caracteres e contendo ao menos um numero passa. Tem que passar neste exemplo
        XCTAssertTrue(viewPresenter.isPasswordValid(senha4))
        
        //verificando se a senha estourando 18 caracteres passa. Aqui tem que falhar
        XCTAssertFalse(viewPresenter.isPasswordValid(senha5))
        
        //veridica se a senha com menos de 6 caracteres passa
        XCTAssertFalse(viewPresenter.isPasswordValid(senha6))
    }
}

//
//  ViewPresenter.swift
//  TesteTecnicoCVC
//
//  Created by Silvio Gollega Jr. on 28/02/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import Foundation

protocol ViewPresenter {
    var view: ViewPrincipal? { get set }
    func alteraSenha()
    func isPasswordValid(_ password : String) -> Bool
}

class ViewPresenterImplementation: ViewPresenter {
    var view: ViewPrincipal?
    private let viewApi = ViewApi()
    init() { }
    
    func alteraSenha() {
        viewApi.chamaAlteraSenha(callback: { _ in
            self.finalizaCadastro()
        })
    }
    
    func finalizaCadastro() {
        DispatchQueue.main.async {
            self.view?.finalizaCadastro()
        }
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d).{6,18}")
        return passwordTest.evaluate(with: password)
    }
}

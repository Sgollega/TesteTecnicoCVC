//
//  ViewApi.swift
//  TesteTecnicoCVC
//
//  Created by Silvio Gollega Jr. on 28/02/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import Foundation

class ViewApi {
    var retorno = ""
    func chamaAlteraSenha(callback: @escaping (String) -> Void) {
        var request = URLRequest(url: URL(string: "https://us-central1-last-minute-app-71f82.cloudfunctions.net/resetPassword")!)
        request.httpMethod = "POST"
        let postString = "userId=1000&newPasword="
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                print("response = \(String(describing: response))")
                let responseString = String(data: data!, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")
                print("request OK")
                self.retorno = "Ok"
            }
            callback(self.retorno)
        }
        task.resume()
    }
    
    func chamaAlteraSenhaNew() -> Bool {
        var myRet = false
        let jsonUrlString = "https://us-central1-last-minute-app-71f82.cloudfunctions.net/resetPassword"
        
        guard let url = URL(string: jsonUrlString) else { return false }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString as Any)
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                myRet = true
            } else {
                myRet = false
            }
        }.resume()
        
        return myRet
    }
    
    func alteraSenha() -> Bool {
        var alterado = false
        self.chamaAlteraSenha { (retorno) in
            if retorno == "Ok" {
                alterado = true
            } else {
                alterado = false
            }
        }
        return (alterado)
    }
    
}

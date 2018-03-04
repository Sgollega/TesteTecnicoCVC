//
//  ViewController.swift
//  TesteTecnicoCVC
//
//  Created by Silvio Gollega Jr. on 25/02/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import UIKit

protocol ViewPrincipal {
    //var retorno: String { get }
    func finalizaCadastro()
}

class ViewController: UIViewController, ViewPrincipal {

    @IBOutlet weak var buttonConfirmar: UIButton!
    @IBOutlet weak var textNovaSenha: UITextField!
    @IBOutlet weak var textRepetirNovaSenha: UITextField!
    @IBOutlet weak var labelErros: UILabel!
    @IBOutlet weak var labelBorder: UILabel!
    @IBOutlet weak var imageCadeado: UIImageView!
    
    //var retorno = ""
    
    var presenter: ViewPresenter = ViewPresenterImplementation()
    
    @IBAction func textNovaSenhaChanged(_ sender: Any) {
        if presenter.isPasswordValid(textNovaSenha.text!) && presenter.isPasswordValid(textRepetirNovaSenha.text!) {
            if textRepetirNovaSenha.text! == textNovaSenha.text! {
               passwordIsOk()
            }
        } else {
            passwordIsNotOk()
        }
    }
    
    func passwordIsOk () {
        buttonConfirmar.backgroundColor = UIColorFromRGB(rgbValue: 0xFF9F1C)
        buttonConfirmar.isEnabled = true
        imageCadeado.image = #imageLiteral(resourceName: "icPasswordGreen")
        labelErros.text = ""
        labelBorder.layer.borderWidth = 0
        self.view.endEditing(true)
    }
    
    func passwordIsNotOk() {
        buttonConfirmar.isEnabled = false
        buttonConfirmar.backgroundColor = UIColorFromRGB(rgbValue: 0xFFD994)
        imageCadeado.image = #imageLiteral(resourceName: "icPassword")
    }
    
    
    @IBAction func textNovaSenhaEdited(_ sender: Any) {
        if !(textRepetirNovaSenha.text?.isEmpty)!  {
            if presenter.isPasswordValid(textNovaSenha.text!) && !presenter.isPasswordValid(textRepetirNovaSenha.text!) {
                passwordSkipRules()
                return
            }
            if textRepetirNovaSenha.text! != textNovaSenha.text! {
                passwordsDontMatch()
                return
            }
            clearError()
        } else {
            clearError()
        }
    }
    
    func passwordSkipRules() {
        labelBorder.layer.borderWidth = 1
        labelBorder.layer.borderColor = UIColor.red.cgColor
        labelErros.text = "ops, as senhas fogem às regras"
        imageCadeado.image = #imageLiteral(resourceName: "icPassword")
    }
    
    func passwordsDontMatch() {
        labelBorder.layer.borderWidth = 1
        labelBorder.layer.borderColor = UIColor.red.cgColor
        labelErros.text = "ops, as senhas não estão iguais"
        imageCadeado.image = #imageLiteral(resourceName: "icPassword")
    }
    
    func clearError() {
        labelErros.text = ""
        labelBorder.layer.borderWidth = 0
    }
    
    @IBAction func textRepetirNovaSenhaChanged(_ sender: Any) {
        if presenter.isPasswordValid(textRepetirNovaSenha.text!) && presenter.isPasswordValid(textNovaSenha.text!){
            if textRepetirNovaSenha.text! == textNovaSenha.text! {
                passwordIsOk()
            }
        } else {
                passwordIsNotOk()
        }
    }
    
    @IBAction func textRepetirNovaSenhaEdited(_ sender: Any) {
        if !(textNovaSenha.text?.isEmpty)!  {
            if !presenter.isPasswordValid(textNovaSenha.text!) && !presenter.isPasswordValid(textRepetirNovaSenha.text!) {
                passwordSkipRules()
                return
            }
            if textRepetirNovaSenha.text! != textNovaSenha.text! {
                passwordsDontMatch()
                return
            }
            clearError()
        } else {
            clearError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        buttonConfirmar.layer.cornerRadius = 20
        self.navigationController?.isToolbarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @IBAction func buttonConfirmarClicked(_ sender: Any) {
        presenter.alteraSenha()
    }
    
    func finalizaCadastro() {
         DispatchQueue.main.async {
            self.view.endEditing(true)
            self.performSegue(withIdentifier: "cadastroOk", sender: self)
         }
    }
}


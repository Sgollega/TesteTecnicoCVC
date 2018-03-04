//
//  SenhaOkViewController.swift
//  TesteTecnicoCVC
//
//  Created by Silvio Gollega Jr. on 25/02/18.
//  Copyright © 2018 SGJ. All rights reserved.
//

import UIKit

class SenhaOkViewController: UIViewController {

    @IBOutlet weak var botaoOk: UIButton!
    
    @IBAction func botaoOkAction(_ sender: Any) {
        
    }
    @IBAction func buttonOkClick(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let backButton = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.plain, target: self, action: #selector(UIWebView.goBack))
        //navigationItem.leftBarButtonItem = backButton
        
        botaoOk.layer.cornerRadius = 20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

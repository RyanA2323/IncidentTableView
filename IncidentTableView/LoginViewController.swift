//
//  LoginViewController.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 3/19/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToList", sender: nil)
    }
    
}

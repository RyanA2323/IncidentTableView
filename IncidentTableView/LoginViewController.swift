//
//  LoginViewController.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 3/19/21.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().presentingViewController = self
        
        // Automatically sign in the user.
        //GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // ...
        
        
    }

    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToList", sender: nil)
    }
    
    
    
    
    
}

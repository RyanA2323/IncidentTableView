//
//  ViewController4.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController4: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    
 
    @IBAction func mapAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toMap1", sender: nil)
    }
    

}

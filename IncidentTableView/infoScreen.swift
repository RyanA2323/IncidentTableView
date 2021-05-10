//
//  infoScreen.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 5/4/21.
//

import UIKit

class infoScreen: UIViewController {

    
    @IBOutlet weak var textOutlet: UITextView!
    var bigLabel = "Situational Examples: \n"
    var smallLabel1 = "Code Red"
    var smallLabel2 = "Medical"
    var smallLabel3 = "Fight"
    var smallLabel4 = "Other"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textOutlet.text = "Situational Examples: \n \n CODE RED \n - Emergency standard \n - Active shooter \n - Unusual suspect \n - Carrier of a weapon \n \n FIGHT \n - Fight about to occur or possible fight risk \n - Fight in progress \n \n MEDICAL \n - Injury \n -Student or teacher fainted \n \n OTHER \n - Unusal person in or near building \n - Gas smell \n - Building maintence"
        
        
        
        
        
    }
    

}

//
//  ViewController5.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController5: UIViewController {

   
    
    @IBOutlet weak var cafeBtn: UIButton!
    @IBOutlet weak var firstFloorImage: UIImageView!
    @IBOutlet weak var mainGymBtn: UIButton!
    @IBOutlet weak var auxGymBtn: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainGymAction(_ sender: UIButton) {
        Incident.location = "Main Gym"
    }
    
    @IBAction func auxGymAction(_ sender: UIButton) {
        Incident.location = "Aux Gym"
    }
    
    @IBAction func cafeAction(_ sender: UIButton) {
        Incident.location = "Cafeteria"
    }
    

    @IBAction func ndFloorAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toLevel2", sender: nil)
    }
    
}

//
//  ViewController5.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController5: UIViewController {

    var location: String = ""
    
    @IBOutlet weak var cafeBtn: UIButton!
    @IBOutlet weak var firstFloorImage: UIImageView!
    @IBOutlet weak var mainGymBtn: UIButton!
    @IBOutlet weak var auxGymBtn: UIButton!
    var incident = Incident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainGymAction(_ sender: UIButton) {
        location = "Main Gym"
        
    }
    
    @IBAction func auxGymAction(_ sender: UIButton) {
        location = "Aux Gym"
    }
    
    @IBAction func cafeAction(_ sender: UIButton) {
        location = "Cafeteria"
    }
    
}

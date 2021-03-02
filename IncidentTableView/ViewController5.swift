//
//  ViewController5.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController5: UIViewController {

    var location: String = ""
    let currentIncidentKey = Core.currentIncidentKey
    
    @IBOutlet weak var cafeBtn: UIButton!
    @IBOutlet weak var firstFloorImage: UIImageView!
    @IBOutlet weak var mainGymBtn: UIButton!
    @IBOutlet weak var auxGymBtn: UIButton!
  //  var incident = Incident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainGymAction(_ sender: UIButton) {
        Core.currentInfoLocation = "Main Gym"
        print(Core.currentInfoLocation ?? "null location")
    }
    
    @IBAction func auxGymAction(_ sender: UIButton) {
        Core.currentInfoLocation = "Aux Gym"
        print(Core.currentInfoLocation ?? "null location")
    }
    
    @IBAction func cafeAction(_ sender: UIButton) {
        Core.currentInfoLocation = "Cafeteria"
        print(Core.currentInfoLocation ?? "null location")
    }
    
    @IBAction func unwind3(_ seg: UIStoryboardSegue ) {
        print("unwinding to first floor")
    }
    
}

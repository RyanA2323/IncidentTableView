//
//  ViewController5.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController5: UIViewController {

    var location: String = ""
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var cafeBtn: UIButton!
    @IBOutlet weak var firstFloorImage: UIImageView!
    @IBOutlet weak var mainGymBtn: UIButton!
    @IBOutlet weak var auxGymBtn: UIButton!
  //  var incident = Incident()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainGymAction(_ sender: UIButton) {
        defaults.setValue("Main Gym", forKey: "currentInfoLocation")
    }
    
    @IBAction func auxGymAction(_ sender: UIButton) {
        defaults.setValue("Aux Gym", forKey: "currentInfoLocation")
    }
    
    @IBAction func cafeAction(_ sender: UIButton) {
        defaults.setValue("Cafe", forKey: "currentInfoLocation")
    }
    
    @IBAction func unwind3(_ seg: UIStoryboardSegue ) {
        print("unwinding to first floor")
    }
    
}

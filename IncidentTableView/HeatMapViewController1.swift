//
//  HeatMapViewController1.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/26/21.
//

import UIKit

class HeatMapViewController1: UIViewController {
    
    var currentIncidentKey: String = "DemoIncident"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let sesh = defaults.object(forKey: "currentIncidentKey") as? String {
            currentIncidentKey = sesh
            print(currentIncidentKey)
        }
    }
    
}

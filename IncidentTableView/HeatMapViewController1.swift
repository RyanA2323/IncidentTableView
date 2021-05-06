//
//  HeatMapViewController1.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/26/21.
//

import UIKit

class HeatMapViewController1: UIViewController {
    
    @IBOutlet weak var incidentLabel: UILabel!
    @IBOutlet weak var incidentLocationView: IncidentLocationView!
    var currentIncidentKey: String = "DemoIncident"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incidentLocationView.setFloorImages([UIImage(named: "Floor1")!, UIImage(named: "floor2")!])
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let sesh = defaults.object(forKey: "currentIncidentKey") as? String {
            currentIncidentKey = sesh
            print(currentIncidentKey)
            incidentLabel.text = "For Incident: \(defaults.value(forKey: "typeIncHeatMap")!)"
            
            // Changing the floor parameter between 1 and 2 will automatically switch the image.
            let DUMMY_LOCATION = Location(pos: CGPoint(x: 0.3, y: 0.7), floor: 1);
            incidentLocationView.setLocation(DUMMY_LOCATION);
        }
    }
    
}

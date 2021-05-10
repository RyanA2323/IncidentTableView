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
            
            
            incidentLabel.text = "For Incident: \(defaults.value(forKey: "typeIncHeatMap") ?? "Defaults Error")"
            
            db.collection("incidents").document(currentIncidentKey).collection("subInformation").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var pointArray: [CGPoint] = []
                    
                    for document in querySnapshot!.documents {
                        // print("\(document.documentID) => \(document.data())")
                        
                        let incidentMade = Incident(inc: .other)
                        incidentMade.key = document.documentID
                        
                        // Temporary Debug Statement: Prints each map coordinate in the console.s
                        // print("Incident (\(document.documentID) - PointX: \(incidentMade.pointx ?? 0), PointY: \(incidentMade.pointy ?? 0)")
                        
                        for dt in document.data() {
                            if dt.key == "pointx" {
                                incidentMade.pointx = dt.value as? CGFloat
                            }
                            if dt.key == "pointy" {
                                incidentMade.pointy = dt.value as? CGFloat
                            }
                        }
                        
                        let pointAdd = CGPoint(x: incidentMade.pointx ?? 0, y: incidentMade.pointy ?? 0)
                        pointArray.append(pointAdd)
                    }
                    
                    for point in pointArray {
                        let locationDisplay = Location(pos: point, floor: 1)
                        self.incidentLocationView.setLocation(locationDisplay)
                    }
                    
                    // Changing the floor parameter between 1 and 2 will automatically switch the image.
                    // let DUMMY_LOCATION = Location(pos: CGPoint(x: 0.3, y: 0.7), floor: 2);
                    // self.incidentLocationView.setLocation(DUMMY_LOCATION);
                }
            }
        }
    }
}

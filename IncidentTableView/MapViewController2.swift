//
//  MapViewController2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 5/6/21.
//

import UIKit

class MapViewController2: UIViewController {

    @IBOutlet var gesture: UITapGestureRecognizer!
    @IBOutlet weak var image: IncidentLocationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.addGestureRecognizer(gesture);
        image.setFloorImages([UIImage(named: "Floor1")!, UIImage(named: "floor2")!]);
    }
    
    
}

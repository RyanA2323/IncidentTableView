//
//  CustomCellTableViewCell.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/23/21.
//

import UIKit
import Firebase

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var incidentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var heatMapBtn: UIButton!
    
    var id: String = "DemoIncident"
    
    func configure(pic: UIImage, incidentType: typeIncident, timeDisplay: String, key: String) {
        incidentLabel.text = "\(incidentType.rawValue)"
        imageIcon.image = pic
        timeLabel.text = timeDisplay
        id = key
    }
    
    @IBAction func heatMapAction(_ sender: UIButton) {
        defaults.setValue(id, forKey: "currentIncidentKey")
    }
}

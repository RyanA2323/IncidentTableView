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
    
    func configure(pic: UIImage, incidentType: typeIncident, timeDisplay: String) {
        incidentLabel.text = "\(incidentType.rawValue)"
        imageIcon.image = pic
        timeLabel.text = timeDisplay
    }
}

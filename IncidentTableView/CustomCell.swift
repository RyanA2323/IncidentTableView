//
//  CustomCellTableViewCell.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/23/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var incidentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    func configure(pic: UIImage, incident: typeIncident) {
        incidentLabel.text = "\(incident.rawValue)"
        imageIcon.image = pic
    }
}

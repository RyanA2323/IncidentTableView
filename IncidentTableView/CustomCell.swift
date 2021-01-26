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
    @IBOutlet weak var infoButton: UIButton!
    
    func configure(pic: UIImage, incident: String) {
        incidentLabel.text = incident
        imageIcon.image = pic
        //time not included yet
    }
}

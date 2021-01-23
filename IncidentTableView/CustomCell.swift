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
    
    func configure(pic: UIImage, incident: String) {
        incidentLabel.text = incident
        imageIcon.image = pic
    }
}

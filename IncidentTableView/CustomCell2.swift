//
//  CustomCell2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 3/1/21.
//

import UIKit

class CustomCell2: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var additionalInfo: UILabel!
    
    func configure(room: String, addInfo: String) {
        if room == "" {
            self.location.text = "Location: N/A"
        } else {
        self.location.text = "Location: \(room)"
        }
        self.additionalInfo.text = "Additional Information: \(addInfo)"
    }
    
}
